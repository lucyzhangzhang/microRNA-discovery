# Discovery of microRNAs in the raw genome of *Eutrema salsugineum*

The official published reference genome of *Eutrema salsuginemum* is far from complete. Currently, its scaffolded form leads to many masked and removed contigs due to low coverage or incomplete assembly. This leads to the disappearance of many interesting intergenic regions and non-coding regions that are somewhat conserved among plant species. One of which being microRNA families.  


In the current iteration of the published reference genome belonging to the Shandong accession of *Eutrema*, there are only one copy of miRNA399 and one copy of miRNA395, but it's commonly known that among the *Brassicaceae* and some monocot crops, there are at least 5 to 6 variance of each miRNA.  


The goal of this project is to blast the raw genomic reads of the YUKON accession (because assembled genome doesn't exist for Yukon) and look for these other copies of mir399 and mir395. (I'll also look for mir827 when I have time)  


The idea for blast-ing is to first look for the 20-22bp conserved sequence using blastn-short, then try to blast for the pre-mirRNA sequences from *Arabidopsis* do differentiate between the families. Last, aligning the reads and assembling them as short transcripts.
