#!/bin/bash

#Two pooled total RNA samples
#(4 pairs of wild-type (WT) and Mecp2-null (KO) male mice;
#postnatal 6-week, the pre-/early-symptomatic stage) were sequenced in a multiplexed configuration (with distinct barcode sequences).
#And, six samples (two litters, one WT and two KO male mice in each litter; postnatal 8-week, the symptomatic stage) were sequenced individually.

#download from ncbi
#wget ftp://ftp-trace.ncbi.nlm.nih.gov/sra/sra-instant/reads/ByStudy/sra/SRP%2FSRP005%2FSRP005132/SRR089647/SRR089647.sra
#wget ftp://ftp-trace.ncbi.nlm.nih.gov/sra/sra-instant/reads/ByStudy/sra/SRP%2FSRP005%2FSRP005132/SRR089648/SRR089648.sra

#http://trace.ddbj.nig.ac.jp/DRASearch/study?acc=SRP005132
#download from ddbj (Japan), which conveniently provides the fastq files
#GSM599735: WT_pooled_6wk
wget ftp://ftp.ddbj.nig.ac.jp/ddbj_database/dra/sralite/ByExp/litesra/SRX/SRX037/SRX037094/SRR089647/SRR089647.sra
wget ftp://ftp.ddbj.nig.ac.jp/ddbj_database/dra/fastq/SRA028/SRA028404/SRX037094/SRR089647.fastq.bz2
#GSM599736: KO_pooled_6wk
wget ftp://ftp.ddbj.nig.ac.jp/ddbj_database/dra/sralite/ByExp/litesra/SRX/SRX037/SRX037095/SRR089648/SRR089648.sra
wget ftp://ftp.ddbj.nig.ac.jp/ddbj_database/dra/fastq/SRA028/SRA028404/SRX037095/SRR089648.fastq.bz2

#sratoolkit
wget http://ftp-trace.ncbi.nlm.nih.gov/sra/sdk/2.3.5-2/sratoolkit.2.3.5-2-centos_linux64.tar.gz
