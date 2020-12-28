#!/usr/bin/perl
use strict;
my %type;
my $label=shift @ARGV;
my $file=shift @ARGV;
open IN,"<$file";
while(<IN>){
	chomp;
	if(/$label/){
		my @info=split /\s+/;
		$info[0]=~s/\-.*//g;
		$type{$info[0]}=$info[14];
	}
}
close IN;

$file=shift @ARGV;
open IN,"<$file";
my %used;
while(<IN>){
	chomp;
	my $id=$_;
	$id=~s/\-.*//g;
	$used{$id}=1
}
close IN;

open OUT1,">alpha.sam";
open OUT2,">beta.sam";
open OUT3,">Acinar.sam";
open OUT4,">Delta.sam";
open OUT5,">Ductal.sam";
open OUT6,">Endothelial1.sam";
open OUT7,">Endothelial2.sam";
open OUT8,">Endothelial.sam";
open OUT9,">Gamma.sam";
open OUT10,">Acinar_like.sam";
my %ids;
$file=shift @ARGV;
open IN,"<$file";
while(<IN>){
	chomp;
	if(/CB\:Z\:([ATCG]+)\-/){
		my $id=$1;
		if($used{$id}){
			$ids{$id}+=1;
			if($type{$id} eq 'Alpha'){
				print OUT1 "$_\n";
			}elsif($type{$id} eq 'Beta'){
				print OUT2 "$_\n";
			}elsif($type{$id} eq 'Acinar'){
                                print OUT3 "$_\n";
                        }elsif($type{$id} eq 'Delta'){
                                print OUT4 "$_\n";
                        }elsif($type{$id} eq 'Ductal'){
                                print OUT5 "$_\n";
                        }elsif($type{$id} eq 'Endothelial1'){
                                print OUT6 "$_\n";
                        }elsif($type{$id} eq 'Endothelial2'){
                                print OUT7 "$_\n";
                        }elsif($type{$id} eq 'Endothelial'){
                                print OUT8 "$_\n";
                        }elsif($type{$id} eq 'Gamma'){
                                print OUT9 "$_\n";
                        }elsif($type{$id} eq 'Acinar_like'){
                                print OUT10 "$_\n";
                        }
		}
	}elsif(/\@/){
		print OUT1 "$_\n";
		print OUT2 "$_\n";
		print OUT3 "$_\n";
		print OUT4 "$_\n";
		print OUT5 "$_\n";
		print OUT6 "$_\n";
		print OUT7 "$_\n";
		print OUT8 "$_\n";
		print OUT9 "$_\n";
		print OUT10 "$_\n";
	}
}
close IN;
close OUT1;
close OUT2;
close OUT3;
close OUT4;
close OUT5;
close OUT6;
close OUT7;
close OUT8;
close OUT9;
close OUT10;

foreach(keys %ids){
	print "$_\t$ids{$_}\t$type{$_}\n";
}
