#!/usr/bin/perl -w
use strict;
my %s2e;
my %s;
open IN,"<mt.gtf";
while(<IN>){
	chomp;
	my @info=split /\s+/;
	if($info[2] eq 'gene'){
		$s2e{$info[3]}=$info[4];	
		$s{$info[3]}=$info[6];
	}
}
close IN;

my @files=@ARGV;
my %alt;
my %ref;
my %per;
my %dp;
my %qual;
my $dp;
my $per;
foreach my $file(@ARGV){
	open IN,"<$file";
	while(<IN>){
		chomp;
		my @info=split/\s+/;
		if($info[0] eq 'MT'){
		my $strand;
		$per=0;
		$dp=0;
		foreach my $s(keys %s2e){
			if($info[1]>=$s && $info[1]<=$s2e{$s}){
				$strand=$s{$s};
			}
		}	
		if(defined($strand)){
		}else{
			$strand="na";
		}
		if(/DP4\=(\d+?)\,(\d+?)\,(\d+?)\,(\d+?)\;/ && ($strand eq '+')){
			$dp=$1+$3;
			if($dp==0){
			}else{
			$per=$3/($1+$3);
			}
		}elsif(/DP4\=(\d+?)\,(\d+?)\,(\d+?)\,(\d+?)\;/ && ($strand eq '-')){
			$dp=$2+$4;
			if($dp==0){
			}else{
			$per=$4/($2+$4);
			}
		}
		if($dp==0 || $strand eq 'na'){
		}else{
		$alt{$info[1]}{$file}=$info[4];
		$per{$info[1]}{$file}=$per;
		$dp{$info[1]}{$file}=$dp;
		$qual{$info[1]}{$file}=$info[5];
		$ref{$info[1]}=$info[3];
		}
		}
	}
	close IN;
}

print "location\tref\tAlpha_c\tpercent\tdepth\tquality\tAlpha\tpercent\tdepth\tquality\tBeta_c\tpercent\tdepth\tquality\tBeta\tpercent\tdepth\tquality\tAcinar_c\tpercent\tdepth\tquality\tAcinar\tpercent\tdepth\tquality\tDelta_c\tpercent\tdepth\tquality\tDelta\tpercent\tdepth\tquality\tDuctal_c\tpercent\tdepth\tquality\tDuctal\tpercent\tdepth\tquality\tAcinar_like_c\tpercent\tdepth\tquality\tAcinar_like\tpercent\tdepth\tquality\tEndothelial_c\tpercent\tdepth\tquality\tEndothelial\tpercent\tdepth\tquality\tGamma_c\tpercent\tdepth\tquality\tGamma\tpercent\tdepth\tquality\t\n";

foreach my $p(sort {$a<=>$b} keys %alt){
	print "$p";
	print "\t$ref{$p}";
	foreach my $label(@files){
		if($alt{$p}{$label}){
			print "\t$alt{$p}{$label}\t$per{$p}{$label}\t$dp{$p}{$label}\t$qual{$p}{$label}";
		}else{
			print "\t$ref{$p}\t1\tna\tna";
		}
	}
	print "\n";
}

