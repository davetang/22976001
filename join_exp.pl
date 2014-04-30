#!/usr/bin/perl

use strict;
use warnings;

my %lookup = ();
my %fasta = ();

my $current_accession = '';

open(IN,'<','ncrna_noncode_v3.fa') || die "Could not open ncrna_noncode_v3.fa: $!\n";
while(<IN>){
   chomp;
   #>nncid | accn | class | organism | name | ref | transcriptID | url | cpcScore | cnci
   if (/^>/){
      my ($nncid, $accn, $class, $organism, $name, $ref, $transcriptID, $url, $cpcScore, $cnci) = split(/\|/);
      $nncid =~ s/^>//;
      $nncid =~ s/\s+//g;
      $accn =~ s/\s+//g;
      #print "[$nncid]\t[$accn]\n";
      if ($accn ne 'NULL'){
         $lookup{$nncid} = $accn;
      } else {
         $lookup{$nncid} = $nncid;
      }
      $current_accession = $nncid;
   } else {
      $fasta{$current_accession} .= $_;
   }
}
close(IN);

my $infile = 'SRR089647_F3_mouse_pirna_exp.tsv';
my $infile2 = 'SRR089648_F3_mouse_pirna_exp.tsv';

my %data = ();
open(IN,'<',$infile) || die "Could not open $infile: $!\n";
while(<IN>){
   chomp;
   my ($pirna,$count) = split(/\t/);
   $data{$pirna} = $count;
}
close(IN);

open(IN,'<',$infile2) || die "Could not open $infile2: $!\n";
while(<IN>){
   chomp;
   my ($pirna,$count) = split(/\t/);
   my $pirna_length = length($fasta{$pirna});
   if (exists $data{$pirna}){
      print "$lookup{$pirna}\t$pirna_length\t$data{$pirna}\t$count\n";
      delete $data{$pirna};
   } else {
      print "$lookup{$pirna}\t$pirna_length\t0\t$count\n";
   }
}
close(IN);

foreach my $pirna (keys %data){
   my $pirna_length = length($fasta{$pirna});
   print "$lookup{$pirna}\t$pirna_length\t$data{$pirna}\t0\n";
}

exit(0);
