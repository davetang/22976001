#!/bin/bash

./download.sh

tar -xzf sratoolkit.2.3.5-2-centos_linux64.tar.gz
tar -xzf SHRiMP_2_2_3.lx26.x86_64.tar.gz
tar -xzf ncrna_NONCODE[v3.0].fasta.tar.gz

rm *.tar.gz

./extract_sra.sh

mv ncrna_NONCODE[v3.0].fasta ncrna_noncode_v3.fa

mouse_pirna.pl > mouse_pirna.fa

./map.sh

exp.pl SRR089647_F3_mouse_pirna_sorted.bam > SRR089647_F3_mouse_pirna_exp.tsv
exp.pl SRR089648_F3_mouse_pirna_sorted.bam > SRR089648_F3_mouse_pirna_exp.tsv

join_exp.pl > SRR089647_SRR089648_exp.tsv
