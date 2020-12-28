#!/usr/bin/perl -w
use strict;
my %cov;
my %perA;
my %perT;
my %perC;
my %perG;
my @cell=@ARGV;
foreach my $dir(@cell){
	open IN,"<$dir\.coverage.txt";
	while(<IN>){
		chomp;
		my @info=split /\,/;
		$cov{$info[0]}{$dir}=$info[2];
	}
	close IN;
	open IN,"<$dir\.A.txt";
        while(<IN>){
                chomp;
                my @info=split /\,/;
		my $cov=$cov{$info[0]}{$dir};
		if($cov==0){
			$cov=0.0001;
		}
		$perA{$info[0]}{$dir}=$info[2]/$cov;
        }
        close IN;
	open IN,"<$dir\.T.txt";
        while(<IN>){
                chomp;
                my @info=split /\,/;
                my $cov=$cov{$info[0]}{$dir};
                if($cov==0){
                        $cov=0.0001;
                }
                $perT{$info[0]}{$dir}=$info[2]/$cov;
        }
        close IN;
	open IN,"<$dir\.C.txt";
        while(<IN>){
                chomp;
                my @info=split /\,/;
                my $cov=$cov{$info[0]}{$dir};
                if($cov==0){
                        $cov=0.0001;
                }
                $perC{$info[0]}{$dir}=$info[2]/$cov;
        }
        close IN;
	open IN,"<$dir\.G.txt";
        while(<IN>){
                chomp;
                my @info=split /\,/;
                my $cov=$cov{$info[0]}{$dir};
                if($cov==0){
                        $cov=0.0001;
                }
                $perG{$info[0]}{$dir}=$info[2]/$cov;
        }
        close IN;
}
=cut
foreach my $p(sort {$a<=>$b} keys %cov){
	if($cov{$p}{'alpha'}){
	}else{
		$cov{$p}{'alpha'}=0;
	}
	if($cov{$p}{'beta'}){
        }else{
                $cov{$p}{'beta'}=0;
        }
	my $bool=0;
	if($cov{$p}{'alpha'}>20 && $cov{$p}{'beta'}>20){
		if(abs($perA{$p}{'beta'}-$perA{$p}{'alpha'})>0.05){
			$bool=1;
		}
		if(abs($perT{$p}{'beta'}-$perT{$p}{'alpha'})>0.05){
			$bool=1;
		}
		if(abs($perC{$p}{'beta'}-$perC{$p}{'alpha'})>0.05){
                        $bool=1;
		}
		if(abs($perG{$p}{'beta'}-$perG{$p}{'alpha'})>0.05){
                	$bool=1;
		}
		if($bool==1){
			print "$p\n";
		}
	}
}
=cut
my @ps=("302","8361","12143","12145","12147","13710");
my %div;
foreach my $c(@cell){
	print "$c";
	foreach my $p(@ps){
		if($perA{$p}{$c}){
			print"\t$perA{$p}{$c}";
		}else{
			print "\t0";
		}
		if($perT{$p}{$c}){
			print"\t$perT{$p}{$c}";
		}else{
			print "\t0";
		}
		if($perC{$p}{$c}){
			print"\t$perC{$p}{$c}";
		}else{
			print "\t0";
		}
		if($perG{$p}{$c}){
        		print"\t$perG{$p}{$c}";
		}else{
			print "\t0";
		}
	}
	print "\n";
	
}
