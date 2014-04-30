#!/bin/bash

database=mouse_pirna.fa

for file in `ls *.csfasta`;
   do base=`basename $file .csfasta`;
   echo "Mapping $file"
   #default settings
   SHRiMP_2_2_3/bin/gmapper-cs $file $database -N 12 > ${base}_mouse_pirna.sam 2> ${base}_mouse_pirna.log
   samtools view -bS ${base}_mouse_pirna.sam > ${base}_mouse_pirna.bam;
   samtools sort ${base}_mouse_pirna.bam ${base}_mouse_pirna_sorted;
   rm ${base}_mouse_pirna.sam ${base}_mouse_pirna.bam;
done
