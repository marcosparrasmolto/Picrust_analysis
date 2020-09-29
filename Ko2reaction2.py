#!/usr/bin/env python

from sys import argv
import csv

dict2 = {}
with open(argv[1], 'r') as tabla:

	for line in tabla:
		line = line.strip()
   		col = line.split(', ')		

	    	counts = [float(x) for x in col[1:]]

	 	if col[0] not in dict2:
     	   		dict2[col[0]] = counts

	  	else:
		       	nuevo = []
        		for i, x in enumerate(dict2[col[0]]):
              			x = x + counts[i]
              			nuevo.append(x)

        		dict2[col[0]] = nuevo

f = open('outfile.txt', 'w') 
writer = csv.writer(f, delimiter = '\t')
for key, value in dict2.iteritems():
    writer.writerow([key] + [value])