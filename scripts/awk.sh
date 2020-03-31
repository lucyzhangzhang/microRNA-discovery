#!/bin/bash

# lmao awk with parallel jank af
awk '{if ($5 == "0" && $3 == "100.000") print $2}' $1
