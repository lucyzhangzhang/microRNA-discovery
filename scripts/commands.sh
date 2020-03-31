#!/bin/bash

# find lines in file A that's not in file B
diff --new-line-format="" --unchanged-line-format="" names395 395tmp

# and if you're stupid and overwrite the orignal fasta file but has the blastdb handy
ls *names* | sed 's/\..*//g' | uniq | blastdbcmd -entry all -db {} -out {}.fa
