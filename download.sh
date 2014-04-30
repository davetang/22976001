#!/bin/bash

#Two pooled total RNA samples
#(4 pairs of wild-type (WT) and Mecp2-null (KO) male mice;
#postnatal 6-week, the pre-/early-symptomatic stage) were sequenced in a multiplexed configuration (with distinct barcode sequences).
#And, six samples (two litters, one WT and two KO male mice in each litter; postnatal 8-week, the symptomatic stage) were sequenced individually.

#download from ncbi
#wget ftp://ftp-trace.ncbi.nlm.nih.gov/sra/sra-instant/reads/ByStudy/sra/SRP%2FSRP005%2FSRP005132/SRR089647/SRR089647.sra
#wget ftp://ftp-trace.ncbi.nlm.nih.gov/sra/sra-instant/reads/ByStudy/sra/SRP%2FSRP005%2FSRP005132/SRR089648/SRR089648.sra
#wget ftp://ftp-trace.ncbi.nlm.nih.gov/sra/sra-instant/reads/ByStudy/sra/SRP%2FSRP005%2FSRP005132/SRR089649/SRR089649.sra
#wget ftp://ftp-trace.ncbi.nlm.nih.gov/sra/sra-instant/reads/ByStudy/sra/SRP%2FSRP005%2FSRP005132/SRR089650/SRR089650.sra
#wget ftp://ftp-trace.ncbi.nlm.nih.gov/sra/sra-instant/reads/ByStudy/sra/SRP%2FSRP005%2FSRP005132/SRR089651/SRR089651.sra
#wget ftp://ftp-trace.ncbi.nlm.nih.gov/sra/sra-instant/reads/ByStudy/sra/SRP%2FSRP005%2FSRP005132/SRR089652/SRR089652.sra
#wget ftp://ftp-trace.ncbi.nlm.nih.gov/sra/sra-instant/reads/ByStudy/sra/SRP%2FSRP005%2FSRP005132/SRR089653/SRR089653.sra
#wget ftp://ftp-trace.ncbi.nlm.nih.gov/sra/sra-instant/reads/ByStudy/sra/SRP%2FSRP005%2FSRP005132/SRR089654/SRR089654.sra

#download from ddbj (Japan)
wget ftp://ftp.ddbj.nig.ac.jp/ddbj_database/dra/sralite/ByExp/litesra/SRX/SRX037/SRX037094/SRR089647/SRR089647.sra
wget ftp://ftp.ddbj.nig.ac.jp/ddbj_database/dra/sralite/ByExp/litesra/SRX/SRX037/SRX037095/SRR089648/SRR089648.sra
wget ftp://ftp.ddbj.nig.ac.jp/ddbj_database/dra/sralite/ByExp/litesra/SRX/SRX037/SRX037096/SRR089649/SRR089649.sra
wget ftp://ftp.ddbj.nig.ac.jp/ddbj_database/dra/sralite/ByExp/litesra/SRX/SRX037/SRX037097/SRR089650/SRR089650.sra
wget ftp://ftp.ddbj.nig.ac.jp/ddbj_database/dra/sralite/ByExp/litesra/SRX/SRX037/SRX037098/SRR089651/SRR089651.sra
wget ftp://ftp.ddbj.nig.ac.jp/ddbj_database/dra/sralite/ByExp/litesra/SRX/SRX037/SRX037099/SRR089652/SRR089652.sra
wget ftp://ftp.ddbj.nig.ac.jp/ddbj_database/dra/sralite/ByExp/litesra/SRX/SRX037/SRX037100/SRR089653/SRR089653.sra
wget ftp://ftp.ddbj.nig.ac.jp/ddbj_database/dra/sralite/ByExp/litesra/SRX/SRX037/SRX037101/SRR089654/SRR089654.sra

#sratoolkit
wget http://ftp-trace.ncbi.nlm.nih.gov/sra/sdk/2.3.5-2/sratoolkit.2.3.5-2-centos_linux64.tar.gz
