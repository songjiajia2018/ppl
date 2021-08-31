#!/usr/bin/perl -w
use strict;
open IN,"</home/songjia/songjiajia/genome_biology/indrops_cell_lines/Supplementary_file/4.txt";
while(<IN>){
	chomp;
	my @info=split /\s+/;
	$info[0]=~s/x2\_S4c\_b\d\.(.*)/$1/g;
	$info[1]=~s/sc/s4/g;
	`ln -s /home/songjia/songjiajia/genome_biology/indrops_cell_lines/lib_SAMN09209578/quant_dir/$info[0]_2.bam s4_$info[0]\_2.bam`;
	print "s4_$info[0]\_2.bam,s4_$info[0],$info[1]\n";
}
close IN;

open IN,"</home/songjia/songjiajia/genome_biology/indrops_cell_lines/Supplementary_file/5.txt";
while(<IN>){
        chomp;
        my @info=split /\s+/;
        $info[0]=~s/x2\_S5c\_b\d\.(.*)/$1/g;
        $info[1]=~s/sc/s5/g;
        `ln -s /home/songjia/songjiajia/genome_biology/indrops_cell_lines/lib_SAMN09209577/quant_dir/$info[0]_2.bam s5_$info[0]\_2.bam`;
        print "s5_$info[0]\_2.bam,s5_$info[0],$info[1]\n";
}
close IN;

open IN,"</home/songjia/songjiajia/genome_biology/indrops_cell_lines/Supplementary_file/6.txt";
while(<IN>){
        chomp;
        my @info=split /\s+/;
        $info[0]=~s/x2\_S6c\_b\d\.(.*)/$1/g;
        $info[1]=~s/sc/s6/g;
        `ln -s /home/songjia/songjiajia/genome_biology/indrops_cell_lines/lib_SAMN09209611/quant_dir/$info[0]_2.bam s6_$info[0]\_2.bam`;
        print "s6_$info[0]\_2.bam,s6_$info[0],$info[1]\n";
}
close IN;

