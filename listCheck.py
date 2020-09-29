#!/usr/bin/env python

from sys import argv

inFile1=open(argv[1],'r')
inFile2=open(argv[2],'r')

lista=[]
for line1 in inFile1:
	lista.append(line1.strip())

lista2=[]
for line2 in inFile2:
	line3=line2.strip()
	col = line3.split('\t')
	if col[0] not in lista:
		lista2.append(col[0])

thefile = open('ReactionsList.txt'+argv[2], 'w') 
thefile.write("\n".join(lista2))
