#!/bin/bash

fasta=/home/davetang/osc-lm2/davetang/genome/hg19.fa
fasta_base=`basename $fasta .fa`

for file in `ls *.csfasta`;
   do base=`basename $file .csfasta`;
   echo "Mapping $file"
   #default settings
   SHRiMP_2_2_3/bin/gmapper-cs $file $fasta -N 8 > ${base}_$fasta_base.sam 2> ${base}_$fasta_base.log
   samtools view -bS ${base}_$fasta_base.sam > ${base}_$fasta_base.bam;
   samtools sort ${base}_$fasta_base.bam ${base}_${fasta_base}_sorted;
   rm ${base}_$fasta_base.sam ${base}_$fasta_base.bam;
done

echo Done
