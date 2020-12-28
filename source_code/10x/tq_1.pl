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
sub max{
	my @a=@_;
	my $max=$a[0];
	foreach(@a){
		if($_>$max){
			$max=$_;
		}
	}
	return $max;
}

my %div;
foreach my $p(sort {$a<=>$b} keys %cov){
        if($cov{$p}{'alpha'}){
        }else{
                $cov{$p}{'alpha'}=0;
        }
        if($cov{$p}{'beta'}){
        }else{
                $cov{$p}{'beta'}=0;
        }
	my @divs;
        if($cov{$p}{'alpha'}>20 && $cov{$p}{'beta'}>20){
        	push @divs,abs($perA{$p}{'beta'}-$perA{$p}{'alpha'});
                push @divs,abs($perT{$p}{'beta'}-$perT{$p}{'alpha'});
                push @divs,abs($perC{$p}{'beta'}-$perC{$p}{'alpha'});
                push @divs,abs($perG{$p}{'beta'}-$perG{$p}{'alpha'});
		$div{$p}=&max(@divs);
	}
}

foreach my $p(sort {$a<=>$b} keys %div){
	print "$p\t$div{$p}\n";
}	
