#!/usr/bin/perl

use strict;
use warnings;

my $usage = "Usage: $0 <infile.bam>\n";
my $infile = shift or die $usage;

#for storing results
my %data = ();

open(IN,'-|',"samtools view $infile") || die "Could not open $infile: $!\n";
while(<IN>){
   chomp;
   my ($qname,$flag,$rname,$pos,$mapq,$cigar,$mrnm,$mpos,$isize,$seq,$qual,$tag,$vtype,$value) = split(/\t/);
   #hash key is the name of read
   #if read maps to another piRNA increment
   if (exists $data{$qname}){
      my $number = scalar(@{$data{$qname}});
      $data{$qname}->[$number] = $rname;
   } else {
      $data{$qname}->[0] = $rname;
   }
}
close(IN);

#for storing expression of piRNAs
my %exp = ();

foreach my $qname (keys %data){
   my $multimap = scalar(@{$data{$qname}});
   #don't work with reads mapping to 5 or more piRNAs
   next if $multimap > 5;
   #print "$qname\t$multimap\n";
   #go through all piRNAs that the read mapped to
   foreach my $pirna (@{$data{$qname}}){
      #print "\t$pirna\n";
      #tally expression for the piRNA
      #and divide by the number of times
      #the read multimapped
      if(exists $exp{$pirna}){
         $exp{$pirna} += 1 / $multimap;
      } else {
         $exp{$pirna} = 1 / $multimap;
      }
   }
}

foreach my $pirna (sort {$exp{$b} <=> $exp{$a}} keys %exp){
   my $pirna_exp = sprintf("%.2f", $exp{$pirna});
   print "$pirna\t$pirna_exp\n";
}

exit(0);
