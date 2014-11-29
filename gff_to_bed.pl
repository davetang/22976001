#!/usr/bin/env perl
 
use strict;
use warnings;
 
#Some usage information
my $usage = "$0 <infile.gff> <outfile.bed>\n";
my $infile = shift or die $usage;
 
#File handles
open(IN,'<',$infile) || die "Could not open $infile: $!\n";
 
#Reading the file
while(<IN>){
   chomp;
   next if (/^$/);
   next if (/^#/);
   my ($seqname, $source, $feature, $start, $end, $score, $strand, $frame, $group) = split(/\t/);
   #1       .       miRNA   20669091        20669163        .       +       .       ACC="MI0000249"; ID="mmu-mir-206";
   #chr1    miRBase miRNA|mmu-mir-206*      20669098        20669120        .       +       .       mmu-mir-206
   my $id = '';
   if (/Name=([a-zA-Z0-9-]+);*/){
      $id = $1;
   } else {
      die "Could not extract ID on line $.:\n$_\n";
   }
   print join("\t",$seqname,$start,$end,$id,$score,$strand),"\n";
}
close(IN);
 
exit(0);
