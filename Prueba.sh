#!/bin/sh

./Ko2reaction1.py Tax4FunProfile_Export_2.txt KO2Reaction.txt> borrar

sed 's/\[//' borrar | sed 's/\]//' | sed "s/'//g" >borrar2

./Ko2reaction2.py borrar2

sed 's/\[//' outfile.txt | sed 's/\]//' |sed 's/, /	/g' >borrar3

grep -m 2 '' Tax4FunProfile_Export_2.txt > encabezado

cat encabezado borrar3>resultados.txt
