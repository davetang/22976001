#!/bin/bash

for file in `ls *_hg19_sorted.bam`;
   do base=`basename $file _sorted.bam`;
   echo "Converting $file to BED"
   bedtools bamtobed -ed -i $file > $base.bed
   echo "Clustering $base.bed"
   bedtools cluster -s -i $base.bed > ${base}_cluster.tsv
   echo "Tallying ${base}_cluster.tsv"
   cat ${base}_cluster.tsv | cut -f7 | uniq -c | sort -k1rn > ${base}_cluster.tally
   echo "Zipping files"
   gzip $base.bed ${base}_cluster.tsv ${base}_cluster.tally
done

echo Done
