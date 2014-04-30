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
      $lookup{$nncid}->{'ORGANISM'} = $organism;
      $lookup{$nncid}->{'CLASS'} = $class;
      $lookup{$nncid}->{'FULL'} = $_;
      $current_accession = $nncid;
   } else {
      $fasta{$current_accession} .= $_;
   }
}
close(IN);

foreach my $nncid (keys %fasta){
   if ($lookup{$nncid}->{'CLASS'} =~ /pirna/i){
      if ($lookup{$nncid}->{'ORGANISM'} =~ /musculus/i){
         print "$lookup{$nncid}->{FULL}\n$fasta{$nncid}\n";
      }
   }
}

exit(0);
