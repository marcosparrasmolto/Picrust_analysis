#!/usr/bin/env python

#Usage Ko2reaction.py KO.biom.txt KO2reaction

from sys import argv

dict = {}

with open(argv[2], 'r') as K2R:
	for line in K2R:
		line = line.strip()
   		col = line.split('\t')		
		if col[0] not in dict:
				dict[col[0]]=[col[1]]
		else:
			dict[col[0]].append(col[1]) 

lista=[]

with open(argv[1], 'r') as tabla:
	lines = tabla.readlines()[2:]
	for line in lines:
		line = line.strip()
  		col = line.split('\t')
		if col[0] in dict:
			l = len(dict[col[0]])
#			print col[0]
#			print int(l)
			v = dict[col[0]]
#			print v
			while (l > 0):
				l = l-1
				print v[l-1] + ', ' + str(col[1:])
				
#				lista.append(v[l-1] + ' ' + ' '.join(col[1:]))
#				print '\n'.join(lista)

#for key, value in dict.iteritems():
#	print key 
#	print value
#