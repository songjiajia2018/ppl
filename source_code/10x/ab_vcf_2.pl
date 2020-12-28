#!/usr/bin/perl -w
use strict;
my @files=@ARGV;
my %alt;
my %ref;
my %per;
my %dp;
my %qual;
foreach my $file(@ARGV){
	open IN,"<$file";
	while(<IN>){
		chomp;
		my @info=split/\s+/;
		if(/DP4\=(\d+?)\,(\d+?)\,(\d+?)\,(\d+?)\;/ && ($info[0] eq 'MT')){
			my $per=($3+$4)/($1+$2+$3+$4);
			my $dp=($1+$2+$3+$4);
			my @info=split /\s+/;
			$alt{$info[1]}{$file}=$info[4];
			$per{$info[1]}{$file}=$per;
			$dp{$info[1]}{$file}=$dp;
			$qual{$info[1]}{$file}=$info[5];
			$ref{$info[1]}=$info[3];
		}
	}
	close IN;
}

print "location\tref\tAlpha_c\tpercent\tdepth\tquality\tAlpha\tpercent\tdepth\tquality\tBeta_c\tpercent\tdepth\tquality\tBeta\tpercent\tdepth\tquality\tAcinar_c\tpercent\tdepth\tquality\tAcinar\tpercent\tdepth\tquality\tDelta_c\tpercent\tdepth\tquality\tDelta\tpercent\tdepth\tquality\tGamma_c\tpercent\tdepth\tquality\tGamma\tpercent\tdepth\tquality\t\n";

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

