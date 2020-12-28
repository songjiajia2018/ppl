#! /bin/bash
cd ./89/89/outs/
bcftools mpileup -Q 30 -A -x -Ou -f /home/songjia/reference/human/Homo_sapiens.GRCh38.dna.primary_assembly.fa alpha.sam|bcftools call --threads 15 -mv > 89_alpha.vcf
bcftools mpileup -Q 30 -A -x -Ou -f /home/songjia/reference/human/Homo_sapiens.GRCh38.dna.primary_assembly.fa beta.sam|bcftools call --threads 15 -mv > 89_beta.vcf
bcftools mpileup -Q 30 -A -x -Ou -f /home/songjia/reference/human/Homo_sapiens.GRCh38.dna.primary_assembly.fa Acinar.sam|bcftools call --threads 15 -mv > 89_acinar.vcf
bcftools mpileup -Q 30 -A -x -Ou -f /home/songjia/reference/human/Homo_sapiens.GRCh38.dna.primary_assembly.fa Delta.sam|bcftools call --threads 15 -mv > 89_delta.vcf
bcftools mpileup -Q 30 -A -x -Ou -f /home/songjia/reference/human/Homo_sapiens.GRCh38.dna.primary_assembly.fa Endothelial1.sam|bcftools call --threads 15 -mv > 89_endo1.vcf
bcftools mpileup -Q 30 -A -x -Ou -f /home/songjia/reference/human/Homo_sapiens.GRCh38.dna.primary_assembly.fa Endothelial2.sam|bcftools call --threads 15 -mv > 89_endo2.vcf
bcftools mpileup -Q 30 -A -x -Ou -f /home/songjia/reference/human/Homo_sapiens.GRCh38.dna.primary_assembly.fa Ductal.sam|bcftools call --threads 15 -mv > 89_ductal.vcf
bcftools mpileup -Q 30 -A -x -Ou -f /home/songjia/reference/human/Homo_sapiens.GRCh38.dna.primary_assembly.fa Gamma.sam|bcftools call --threads 15 -mv > 89_gamma.vcf
cd ../../../
cd ./87/outs/
bcftools mpileup --threads 15 -Q 30 -A -x -Ou -f /home/songjia/reference/human/Homo_sapiens.GRCh38.dna.primary_assembly.fa alpha.sam|bcftools call --threads 15 -mv > 87_alpha.vcf
bcftools mpileup --threads 15 -Q 30 -A -x -Ou -f /home/songjia/reference/human/Homo_sapiens.GRCh38.dna.primary_assembly.fa beta.sam|bcftools call --threads 15 -mv > 87_beta.vcf
bcftools mpileup --threads 15 -Q 30 -A -x -Ou -f /home/songjia/reference/human/Homo_sapiens.GRCh38.dna.primary_assembly.fa Acinar.sam|bcftools call --threads 15 -mv > 87_acinar.vcf
bcftools mpileup --threads 15 -Q 30 -A -x -Ou -f /home/songjia/reference/human/Homo_sapiens.GRCh38.dna.primary_assembly.fa Delta.sam|bcftools call --threads 15 -mv > 87_delta.vcf
bcftools mpileup --threads 15 -Q 30 -A -x -Ou -f /home/songjia/reference/human/Homo_sapiens.GRCh38.dna.primary_assembly.fa Endothelial1.sam|bcftools call --threads 15 -mv > 87_endo1.vcf
bcftools mpileup --threads 15 -Q 30 -A -x -Ou -f /home/songjia/reference/human/Homo_sapiens.GRCh38.dna.primary_assembly.fa Endothelial2.sam|bcftools call --threads 15 -mv > 87_endo2.vcf
bcftools mpileup --threads 15 -Q 30 -A -x -Ou -f /home/songjia/reference/human/Homo_sapiens.GRCh38.dna.primary_assembly.fa Ductal.sam|bcftools call --threads 15 -mv > 87_ductal.vcf
bcftools mpileup --threads 15 -Q 30 -A -x -Ou -f /home/songjia/reference/human/Homo_sapiens.GRCh38.dna.primary_assembly.fa Gamma.sam|bcftools call --threads 15 -mv > 87_gamma.vcf
cd ../../
cd ./88/outs/
bcftools mpileup --threads 15 -Q 30 -A -x -Ou -f /home/songjia/reference/human/Homo_sapiens.GRCh38.dna.primary_assembly.fa alpha.sam|bcftools call --threads 15 -mv > 88_alpha.vcf
bcftools mpileup --threads 15 -Q 30 -A -x -Ou -f /home/songjia/reference/human/Homo_sapiens.GRCh38.dna.primary_assembly.fa beta.sam|bcftools call --threads 15 -mv > 88_beta.vcf
bcftools mpileup --threads 15 -Q 30 -A -x -Ou -f /home/songjia/reference/human/Homo_sapiens.GRCh38.dna.primary_assembly.fa Acinar.sam|bcftools call --threads 15 -mv > 88_acinar.vcf
bcftools mpileup --threads 15 -Q 30 -A -x -Ou -f /home/songjia/reference/human/Homo_sapiens.GRCh38.dna.primary_assembly.fa Delta.sam|bcftools call --threads 15 -mv > 88_delta.vcf
bcftools mpileup --threads 15 -Q 30 -A -x -Ou -f /home/songjia/reference/human/Homo_sapiens.GRCh38.dna.primary_assembly.fa Endothelial1.sam|bcftools call --threads 15 -mv > 88_endo1.vcf
bcftools mpileup --threads 15 -Q 30 -A -x -Ou -f /home/songjia/reference/human/Homo_sapiens.GRCh38.dna.primary_assembly.fa Endothelial2.sam|bcftools call --threads 15 -mv > 88_endo2.vcf
bcftools mpileup --threads 15 -Q 30 -A -x -Ou -f /home/songjia/reference/human/Homo_sapiens.GRCh38.dna.primary_assembly.fa Ductal.sam|bcftools call --threads 15 -mv > 88_ductal.vcf
bcftools mpileup --threads 15 -Q 30 -A -x -Ou -f /home/songjia/reference/human/Homo_sapiens.GRCh38.dna.primary_assembly.fa Gamma.sam|bcftools call --threads 15 -mv > 88_gamma.vcf
cd ../../
cd ./90/90/outs/
bcftools mpileup --threads 15 -Q 30 -A -x -Ou -f /home/songjia/reference/human/Homo_sapiens.GRCh38.dna.primary_assembly.fa alpha.sam|bcftools call --threads 15 -mv > 90_alpha.vcf
bcftools mpileup --threads 15 -Q 30 -A -x -Ou -f /home/songjia/reference/human/Homo_sapiens.GRCh38.dna.primary_assembly.fa beta.sam|bcftools call --threads 15 -mv > 90_beta.vcf
bcftools mpileup --threads 15 -Q 30 -A -x -Ou -f /home/songjia/reference/human/Homo_sapiens.GRCh38.dna.primary_assembly.fa Acinar.sam|bcftools call --threads 15 -mv > 90_acinar.vcf
bcftools mpileup --threads 15 -Q 30 -A -x -Ou -f /home/songjia/reference/human/Homo_sapiens.GRCh38.dna.primary_assembly.fa Delta.sam|bcftools call --threads 15 -mv > 90_delta.vcf
bcftools mpileup --threads 15 -Q 30 -A -x -Ou -f /home/songjia/reference/human/Homo_sapiens.GRCh38.dna.primary_assembly.fa Endothelial1.sam|bcftools call --threads 15 -mv > 90_endo1.vcf
bcftools mpileup --threads 15 -Q 30 -A -x -Ou -f /home/songjia/reference/human/Homo_sapiens.GRCh38.dna.primary_assembly.fa Endothelial2.sam|bcftools call --threads 15 -mv > 90_endo2.vcf
bcftools mpileup --threads 15 -Q 30 -A -x -Ou -f /home/songjia/reference/human/Homo_sapiens.GRCh38.dna.primary_assembly.fa Ductal.sam|bcftools call --threads 15 -mv > 90_ductal.vcf
bcftools mpileup --threads 15 -Q 30 -A -x -Ou -f /home/songjia/reference/human/Homo_sapiens.GRCh38.dna.primary_assembly.fa Gamma.sam|bcftools call --threads 15 -mv > 90_gamma.vcf
cd ../../../
