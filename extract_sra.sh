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
