#!/bin/bash

echo Downloading files

./download.sh

echo Extracting files

tar -xzf sratoolkit.2.3.5-2-centos_linux64.tar.gz
tar -xzf SHRiMP_2_2_3.lx26.x86_64.tar.gz
tar -xzf ncrna_NONCODE[v3.0].fasta.tar.gz

echo Removing tarballs

rm *.tar.gz

echo Extracting reads from sra files

./extract_sra.sh

mv ncrna_NONCODE[v3.0].fasta ncrna_noncode_v3.fa

echo Extracting mouse piRNAs

mouse_pirna.pl > mouse_pirna.fa

echo Mapping reads to mouse piRNAs

./map.sh

echo Generating piRNA expression

exp.pl SRR089647_F3_mouse_pirna_sorted.bam > SRR089647_F3_mouse_pirna_exp.tsv
exp.pl SRR089648_F3_mouse_pirna_sorted.bam > SRR089648_F3_mouse_pirna_exp.tsv

echo Finalising results

join_exp.pl > SRR089647_SRR089648_exp.tsv

echo Done
