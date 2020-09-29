#!/bin/sh

pick_otus.py -i Global.fa -o Global/ -m usearch61_ref -C #First step is to pick the OTUs from our 16s dataset.
pick_rep_set.py -i Global/Global_otus.txt -f Global.fa -o rep_set.fasta
prinseq-lite.pl -fasta rep_set.fasta -out_format 1 -out_good rep_set.good
assign_taxonomy.py -i rep_set.good.fasta -o rep_set.good.assignedTax -m rdp #We use rdp classifier for taxa assignment.
make_otu_table.py -i Global/Global_otus.txt -t rep_set.good.assignedTax/rep_set.good_tax_assignments.txt -o All_table.biom #We create a OTU table using the info form previous analysis

## Normalization and KOs calculation

normalize_by_copy_number.py -i All_table.biom -o All_table_norm.biom #Here we normalize by copy number the total count for each OTU
predict_metagenomes.py -i All_table_norm.biom -o metagenome_predictions.biom --gg_version 13_5 --with_confidence -a nsti_per_sample.tab #PICRUST is permorfed within this line. We export the nsti table too in this step

## Convert to table, convert into reactions, add taxonomy info column and transform again into biom table

biom convert -i metagenome_predictions.biom -o table.from_biom.txt --to-tsv
sh Prueba.sh # This script transform out table into reactions, using the KO data info in KO2Reaction.txt file
paste All_table_normKO.tab.txt TaxNa.txt > All_table_normKOtaxNa.txt #Here we paste a column with NA info where we should have the taxonomy info, but we are not using it
biom convert -i All_table_normKOtaxNa.txt -o All_table_normKOtax.tab_hdf5.biom --table-type="OTU table" --to-hdf5 --process-obs-metadata taxonomy #We transform back our table into a biom table

## Core calc

compute_core_microbiome.py -i All_table_normKOtax.tab_hdf5.biom -o All_table_normKO_core100 --min_fraction_for_core 1 #With this script we calculate the minimun core fraction, and we can change that value from 0.5 to 1 (50-100%)

## Remove human reactions

listCheck.py Human_reactions_list.txt core_otus.txt #This scripts remove human reactions from our list
