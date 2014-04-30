#!/bin/bash

for file in `ls *.sra`;
   do base=`basename $file .sra`;
   sratoolkit.2.3.5-2-centos_linux64/bin/abi-dump -A $base $file;
done

#output
#Read 3660124 spots for SRR089647.sra
#Written 3660124 spots for SRR089647.sra
#Read 2789136 spots for SRR089648.sra
#Written 2789136 spots for SRR089648.sra
#Read 33608586 spots for SRR089649.sra
#Written 33608586 spots for SRR089649.sra
#Read 34823537 spots for SRR089650.sra
#Written 34823537 spots for SRR089650.sra
#Read 34888098 spots for SRR089651.sra
#Written 34888098 spots for SRR089651.sra
#Read 38433920 spots for SRR089652.sra
#Written 38433920 spots for SRR089652.sra
#Read 33039277 spots for SRR089653.sra
#Written 33039277 spots for SRR089653.sra
#Read 36680731 spots for SRR089654.sra
#Written 36680731 spots for SRR089654.sra
