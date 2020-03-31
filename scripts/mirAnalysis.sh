#!/bin/bash

# parse data from miRBase
# lol

# $1 = mir text file
# $2 = ath reference
# file
while read name loci strand
do
    strand=$(echo "$strand" | sed 's/\[\|\]//g')
    samtools faidx $2 ${loci:3} -o $name.fa
    sed -i "s/>.*/>$name/" $name.fa
    if [ "$strand" == "-" ]
    then
            ~/Eutrema/scripts/reverse.sh $name.fa $name
            mv $name.fasta $name.fa
    fi
#    echo ${loci:3} and $name and $strand
done < $1

# blast commands to find reads with these conserved regions
# same command for 399 and 395
# blastn -query mir395-a-mature.fa -db ~/scratch/yukon_reads/lucytrim/dedupe/allYukon -outfmt 6 -num_threads 8 -out 395.blastout -task "blastn-short" &
# ls *.399*.fa | parallel -j 4 blastn -query {} -db ~/scratch/yukon_reads/lucytrim/dedupe/allYukon -outfmt 6 -num_threads 8 -out {.}.blastout &

# pull the hits out and blast the pre-miRNAs on them
awk '{print $2}' 395a.blastshort > names395

# if no -o option is specified the results will be printed to STDOUT
cat names395 | parallel samtools faidx ~/scratch/yukon_reads/lucytrim/dedupe/allYukon {} >> 395reads.fa &
makeblastdb -in 395reads.fa -dbtype nucl -out 395reads &
ls ath-MIR395* | parallel -j 4 blastn -query {} -db 395reads -outfmt 6 -out {.}.blastout &
