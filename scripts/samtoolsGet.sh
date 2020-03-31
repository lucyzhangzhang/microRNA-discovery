#!/bin/bash

# given a list of names and the name of the fa file you want to pull from
# $1 = fa file 
# $2 = list of names from blast results outfmt 6o

name=$(basename -- "$2")
name=$(echo $name | sed 's/\..*//g')
cat $2 | parallel -j 10 samtools faidx $1 {} >> fasta/$name-in-eu.fa
echo $name $1 $2
