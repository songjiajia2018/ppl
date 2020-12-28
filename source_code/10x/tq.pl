#!/usr/bin/perl -w
use strict;
my %cov;
my %perA;
my %perT;
my %perC;
my %perG;
my $label=shift @ARGV;
my @cell=("beta","alpha");
foreach my $dir(@cell){
	open IN,"<$label/$dir\.coverage.txt";
	while(<IN>){
		chomp;
		my @info=split /\,/;
		$cov{$info[0]}{$dir}=$info[2];
	}
	close IN;
	open IN,"<$label/$dir\.A.txt";
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
	open IN,"<$label/$dir\.T.txt";
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
	open IN,"<$label/$dir\.C.txt";
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
	open IN,"<$label/$dir\.G.txt";
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
foreach my $p(sort {$a<=>$b} keys %cov){
	my @bs1;
	if($cov{$p}{'alpha'}){
	}else{
		$cov{$p}{'alpha'}=0;
	}
	if($cov{$p}{'beta'}){
        }else{
                $cov{$p}{'beta'}=0;
        }
	if($cov{$p}{'alpha'}>50 && $cov{$p}{'beta'}>50){
	if($perA{$p}{'beta'}){
		push @bs1,"A";
	}elsif($perT{$p}{'beta'}){
                push @bs1,"T";
        }if($perC{$p}{'beta'}){
                push @bs1,"C";
        }if($perG{$p}{'beta'}){
                push @bs1,"G";
        }
	my @bs2;
	if($perA{$p}{'alpha'}){
                push @bs2,"A";
        }elsif($perT{$p}{'alpha'}){
                push @bs2,"T";
        }if($perC{$p}{'alpha'}){
                push @bs2,"C";
        }if($perG{$p}{'alpha'}){
                push @bs2,"G";
        }
	my $nu1=@bs1;
	my $nu2=@bs2;
	if($nu1>1 || $nu2>1){
		print "$p\t@bs1\t@bs2\n";
	}elsif($bs1[0] ne $bs2[0]){
		print "$p\t$bs1[0]\t$bs2[0]\n";
	}
	}
}	
