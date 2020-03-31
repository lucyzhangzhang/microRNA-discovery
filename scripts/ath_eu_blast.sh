#!/bin/bash

blastn -query $1 -db $2 -out $3 -outfmt 6 -num_threads 2
