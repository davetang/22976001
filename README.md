piRNAs warrant investigation in Rett Syndrome: an omics perspective
----------------

The entire analysis for this paper <http://www.ncbi.nlm.nih.gov/pubmed/22976001> can be reproduced by running

`git clone https://github.com/davetang/22976001.git` <br />
`cd 22976001` <br />
`run.sh` <br />

on a 64 bit machine running CentOS/RHEL or Ubuntu.

Also check out my blog post on this work at <http://davetang.org/muse/2014/05/01/rett-syndrome-and-pirnas/>

I have included the final results at <https://github.com/davetang/22976001/blob/master/SRR089647_SRR089648_exp.tsv>

## Some statistics

How many reads were deposited?

<pre>
cat SRR089647_F3.csfasta | grep "^>" | wc -l
3660124
cat SRR089648_F3.csfasta | grep "^>" | wc -l
2789136
</pre>

How many reads were mapped to mm9?

<pre>
samtools view SRR089647_F3_mm9_sorted.bam | cut -f1 | sort -u | wc -l
3656778
samtools view SRR089648_F3_mm9_sorted.bam | cut -f1 | sort -u | wc -l
2785724
</pre>

How many places did the reads map to?

<pre>
samtools view SRR089647_F3_mm9_sorted.bam | cut -f1 | sort | uniq -c | awk '{print $1}' | sort | uniq -c
   9685 1
2743596 10
  20058 2
  46663 3
  47740 4
  63604 5
  88347 6
 128984 7
 134207 8
 373894 9
samtools view SRR089648_F3_mm9_sorted.bam | cut -f1 | sort | uniq -c | awk '{print $1}' | sort | uniq -c
  10612 1
2128072 10
  17810 2
  36804 3
 102631 4
  75542 5
  77990 6
 109670 7
  98112 8
 128481 9
</pre>

How many read clusters?

<pre>
zcat SRR089647_F3_mm9_cluster.tally.gz | wc -l
10754196
zcat SRR089648_F3_mm9_cluster.tally.gz | wc -l
6572115
</pre>

The number of read clusters is greater than the number of reads because I stored up to ten multi-mapping locations.
