#!/usr/bin/env python3
import re
import sys
import itertools as it

fastaFile = str(sys.argv[1])
#this one only works for completely matched alignments

#collapse string function for use later
def collapse(strFrag):
    for repeat in range(0, len(strFrag)-1):
        bestMatch = [2, '', '']
        for otherStr in strFrag[-1]:
            for x in range(0, len(otherStr)):
                if otherStr[x:] == strFrag[0][:len(otherStr[x:])]:
                    if len(otherStr)-x > bestMatch[0]:
                        bestMatch = [len(otherStr)-x, strFrag.index(otherStr), otherStr[:x]+strFrag[0]]
                if otherStr[:-x] == strFrag[0][-len(otherStr[x:]):]:
                    if x > bestMatch[0]:
                        bestMatch = [x, strFrag.index(otherStr), strFrag[0]+otherStr[-x:]]
            if bestMatch[0] > 2:
                strFrag[0] = bestMatch[2]
                strFrag = strFrag[:bestMatch[1]]+strFrag[bestMatch[1]+1:]
    
    return(strFrag[0])

#function to print new line after every 75 characters becasue this is fasta
def insert_newlines(string, every = 75):
    return('\n'.join(string[i:i+every] for i in range(0, len(string), every)))

seqList = []
#open fasta file and get the sequences
with open(fastaFile, 'r') as f:
    for key,group in it.groupby(f, lambda line: line.startswith('>')):
        if not key:
            group = list(group)
            group = ''.join(group)
            group = group.replace('\n','').replace('-', '')
            seqList.append(group) 
#    print('\n'.join(seqList))
#    myAnswer = input("Proceed? [Y/N]: ")
#    if myAnswer != 'Y' or myAnswer != 'y':
#        print("Aborting")
#        exit
#    else:
#        collapsed = collapse(seqList)
#        print(collapsed)
    collapsed = collapse(seqList)
    print(">" + fastaFile + '\n' + insert_newlines(collapsed.upper()))
