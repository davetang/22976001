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

What percent of reads were mapped to mm9?

<pre>
bc -l<<<3656778/3660124*100
99.90858233218328122200
bc -l<<<2785724/2789136*100
99.87766820979686899400
</pre>

How many read clusters?

<pre>
zcat SRR089647_F3_mm9_cluster.tally.gz | wc -l
10754196
zcat SRR089648_F3_mm9_cluster.tally.gz | wc -l
6572115
</pre>

The number of read clusters is greater than the number of reads because I stored up to ten multi-mapping locations.
