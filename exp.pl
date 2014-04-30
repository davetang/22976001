#!/usr/bin/perl

use strict;
use warnings;

my $usage = "Usage: $0 <infile.bam>\n";
my $infile = shift or die $usage;

my %data = ();

open(IN,'-|',"samtools view $infile") || die "Could not open $infile: $!\n";
while(<IN>){
   chomp;
   my ($qname,$flag,$rname,$pos,$mapq,$cigar,$mrnm,$mpos,$isize,$seq,$qual,$tag,$vtype,$value) = split;
   if (exists $data{$qname}){
      my $number = scalar(@{$data{$qname}});
      $data{$qname}->[$number] = $rname;
   } else {
      $data{$qname}->[0] = $rname;
   }
}
close(IN);

my %exp = ();

foreach my $qname (keys %data){
   my $multimap = scalar(@{$data{$qname}});
   next if $multimap > 5;
   #print "$qname\t$multimap\n";
   foreach my $number (@{$data{$qname}}){
      #print "\t$number\n";
      if(exists $exp{$number}){
         $exp{$number} += 1 / $multimap;
      } else {
         $exp{$number} = 1 / $multimap;
      }
   }
}

foreach my $pirna (sort {$exp{$b} <=> $exp{$a}} keys %exp){
   print "$pirna\t$exp{$pirna}\n";
}

exit(0);
