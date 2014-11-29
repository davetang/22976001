#!/bin/bash

#set some variables
my_pre=mm9
my_bam_dir=bam

echo Preparing paraclu input files
my_awk='{OFS="\t"; if($6=="+") print $1,$6,$2,1; else print $1,$6,$3-1,1}'
parallel --verbose "bamToBed -i {} | awk '$my_awk' > {.}.temp" ::: $my_bam_dir/*.bam
cat $my_bam_dir/*.temp > $my_pre.input
cat $my_pre.input | sort -k1,1 -k2,2 -k3,3n | groupBy -g 1,2,3 -c 4 -o sum > ${my_pre}_sum.input

echo Clustering
paraclu 10 ${my_pre}_sum.input > ${my_pre}_sum.output

echo Simplifying clusters
paraclu-cut.sh ${my_pre}_sum.output > ${my_pre}_sum_simp.output

echo Converting to BED
cat ${my_pre}_sum_simp.output | awk 'OFS="\t" {print $1, $3, $4, $1"_"$3"_"$4"_"$2, $6, $2}' | sort -k1,1V -k2,2n -k6,6 > ${my_pre}_sum_simp.bed

echo Preparing count files
parallel --verbose "/home/davetang/github/paraclu_prep/count.pl {} ${my_pre}_sum_simp.bed > {.}.count" ::: $my_bam_dir/*.temp

echo Tallying count files
/home/davetang/github/paraclu_prep/tally.pl ${my_pre}_sum_simp.bed $my_bam_dir > ${my_pre}_sum_simp.tally

echo Obtaining peaks
/home/davetang/github/paraclu_prep/peak.pl ${my_pre}_sum.input ${my_pre}_sum_simp.bed > ${my_pre}_sum_simp_peak.tsv

echo Done
