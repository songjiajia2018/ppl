#! /bin/bash
cd ./83/83/outs/
samtools view -@ 15 -bS alpha.sam > alpha.bam
samtools sort -@ 15 alpha.bam -o alpha.sorted.bam
samtools index -@ 15  alpha.sorted.bam
bcftools mpileup -Q 30 -A -x -Ou -r MT -f /home/songjia/reference/human/Homo_sapiens.GRCh38.dna.primary_assembly.fa --threads 15 alpha.sorted.bam |bcftools call --threads 15 -mv > alpha.vcf
samtools view -@ 15 -bS beta.sam > beta.bam
samtools sort -@ 15 beta.bam -o beta.sorted.bam
samtools index -@ 15  beta.sorted.bam
bcftools mpileup -Q 30 -A -x -Ou -r MT -f /home/songjia/reference/human/Homo_sapiens.GRCh38.dna.primary_assembly.fa --threads 15 beta.sorted.bam |bcftools call --threads 15 -mv > beta.vcf
samtools view -@ 15 -bS Acinar.sam > Acinar.bam
samtools sort -@ 15 Acinar.bam -o Acinar.sorted.bam
samtools index -@ 15  Acinar.sorted.bam
bcftools mpileup -Q 30 -A -x -Ou -r MT -f /home/songjia/reference/human/Homo_sapiens.GRCh38.dna.primary_assembly.fa --threads 15 Acinar.sorted.bam |bcftools call --threads 15 -mv > Acinar.vcf
samtools view -@ 15 -bS Delta.sam > Delta.bam
samtools sort -@ 15 Delta.bam -o Delta.sorted.bam
samtools index -@ 15  Delta.sorted.bam
bcftools mpileup -Q 30 -A -x -Ou -r MT -f /home/songjia/reference/human/Homo_sapiens.GRCh38.dna.primary_assembly.fa --threads 15 Delta.sorted.bam |bcftools call --threads 15 -mv > Delta.vcf
samtools view -@ 15 -bS Ductal.sam > Ductal.bam
samtools sort -@ 15 Ductal.bam -o Ductal.sorted.bam
samtools index -@ 15  Ductal.sorted.bam
bcftools mpileup -Q 30 -A -x -Ou -r MT -f /home/songjia/reference/human/Homo_sapiens.GRCh38.dna.primary_assembly.fa --threads 15 Ductal.sorted.bam |bcftools call --threads 15 -mv > Ductal.vcf
samtools view -@ 15 -bS Endothelial1.sam > Endothelial1.bam
samtools sort -@ 15 Endothelial1.bam -o Endothelial1.sorted.bam
samtools index -@ 15  Endothelial1.sorted.bam
bcftools mpileup -Q 30 -A -x -Ou -r MT -f /home/songjia/reference/human/Homo_sapiens.GRCh38.dna.primary_assembly.fa --threads 15 Endothelial1.sorted.bam |bcftools call --threads 15 -mv > Endothelial1.vcf
samtools view -@ 15 -bS Endothelial2.sam > Endothelial2.bam
samtools sort -@ 15 Endothelial2.bam -o Endothelial2.sorted.bam
samtools index -@ 15  Endothelial2.sorted.bam
bcftools mpileup -Q 30 -A -x -Ou -r MT -f /home/songjia/reference/human/Homo_sapiens.GRCh38.dna.primary_assembly.fa --threads 15 Endothelial2.sorted.bam |bcftools call --threads 15 -mv > Endothelial2.vcf
samtools view -@ 15 -bS Gamma.sam > Gamma.bam
samtools sort -@ 15 Gamma.bam -o Gamma.sorted.bam
samtools index -@ 15  Gamma.sorted.bam
bcftools mpileup -Q 30 -A -x -Ou -r MT -f /home/songjia/reference/human/Homo_sapiens.GRCh38.dna.primary_assembly.fa --threads 15 Gamma.sorted.bam |bcftools call --threads 15 -mv > Gamma.vcf
cd ../../../
cd ./84/outs/
samtools view -@ 15 -bS alpha.sam > alpha.bam
samtools sort -@ 15 alpha.bam -o alpha.sorted.bam
samtools index -@ 15  alpha.sorted.bam
bcftools mpileup -Q 30 -A -x -Ou -r MT -f /home/songjia/reference/human/Homo_sapiens.GRCh38.dna.primary_assembly.fa --threads 15 alpha.sorted.bam |bcftools call --threads 15 -mv > alpha.vcf
samtools view -@ 15 -bS beta.sam > beta.bam
samtools sort -@ 15 beta.bam -o beta.sorted.bam
samtools index -@ 15  beta.sorted.bam
bcftools mpileup -Q 30 -A -x -Ou -r MT -f /home/songjia/reference/human/Homo_sapiens.GRCh38.dna.primary_assembly.fa --threads 15 beta.sorted.bam |bcftools call --threads 15 -mv > beta.vcf
samtools view -@ 15 -bS Acinar.sam > Acinar.bam
samtools sort -@ 15 Acinar.bam -o Acinar.sorted.bam
samtools index -@ 15  Acinar.sorted.bam
bcftools mpileup -Q 30 -A -x -Ou -r MT -f /home/songjia/reference/human/Homo_sapiens.GRCh38.dna.primary_assembly.fa --threads 15 Acinar.sorted.bam |bcftools call --threads 15 -mv > Acinar.vcf
samtools view -@ 15 -bS Delta.sam > Delta.bam
samtools sort -@ 15 Delta.bam -o Delta.sorted.bam
samtools index -@ 15  Delta.sorted.bam
bcftools mpileup -Q 30 -A -x -Ou -r MT -f /home/songjia/reference/human/Homo_sapiens.GRCh38.dna.primary_assembly.fa --threads 15 Delta.sorted.bam |bcftools call --threads 15 -mv > Delta.vcf
samtools view -@ 15 -bS Ductal.sam > Ductal.bam
samtools sort -@ 15 Ductal.bam -o Ductal.sorted.bam
samtools index -@ 15  Ductal.sorted.bam
bcftools mpileup -Q 30 -A -x -Ou -r MT -f /home/songjia/reference/human/Homo_sapiens.GRCh38.dna.primary_assembly.fa --threads 15 Ductal.sorted.bam |bcftools call --threads 15 -mv > Ductal.vcf
samtools view -@ 15 -bS Endothelial1.sam > Endothelial1.bam
samtools sort -@ 15 Endothelial1.bam -o Endothelial1.sorted.bam
samtools index -@ 15  Endothelial1.sorted.bam
bcftools mpileup -Q 30 -A -x -Ou -r MT -f /home/songjia/reference/human/Homo_sapiens.GRCh38.dna.primary_assembly.fa --threads 15 Endothelial1.sorted.bam |bcftools call --threads 15 -mv > Endothelial1.vcf
samtools view -@ 15 -bS Endothelial2.sam > Endothelial2.bam
samtools sort -@ 15 Endothelial2.bam -o Endothelial2.sorted.bam
samtools index -@ 15  Endothelial2.sorted.bam
bcftools mpileup -Q 30 -A -x -Ou -r MT -f /home/songjia/reference/human/Homo_sapiens.GRCh38.dna.primary_assembly.fa --threads 15 Endothelial2.sorted.bam |bcftools call --threads 15 -mv > Endothelial2.vcf
samtools view -@ 15 -bS Gamma.sam > Gamma.bam
samtools sort -@ 15 Gamma.bam -o Gamma.sorted.bam
samtools index -@ 15  Gamma.sorted.bam
bcftools mpileup -Q 30 -A -x -Ou -r MT -f /home/songjia/reference/human/Homo_sapiens.GRCh38.dna.primary_assembly.fa --threads 15 Gamma.sorted.bam |bcftools call --threads 15 -mv > Gamma.vcf
cd ../../
cd ./85/outs/
samtools view -@ 15 -bS alpha.sam > alpha.bam
samtools sort -@ 15 alpha.bam -o alpha.sorted.bam
samtools index -@ 15  alpha.sorted.bam
bcftools mpileup -Q 30 -A -x -Ou -r MT -f /home/songjia/reference/human/Homo_sapiens.GRCh38.dna.primary_assembly.fa --threads 15 alpha.sorted.bam |bcftools call --threads 15 -mv > alpha.vcf
samtools view -@ 15 -bS beta.sam > beta.bam
samtools sort -@ 15 beta.bam -o beta.sorted.bam
samtools index -@ 15  beta.sorted.bam
bcftools mpileup -Q 30 -A -x -Ou -r MT -f /home/songjia/reference/human/Homo_sapiens.GRCh38.dna.primary_assembly.fa --threads 15 beta.sorted.bam |bcftools call --threads 15 -mv > beta.vcf
samtools view -@ 15 -bS Acinar.sam > Acinar.bam
samtools sort -@ 15 Acinar.bam -o Acinar.sorted.bam
samtools index -@ 15  Acinar.sorted.bam
bcftools mpileup -Q 30 -A -x -Ou -r MT -f /home/songjia/reference/human/Homo_sapiens.GRCh38.dna.primary_assembly.fa --threads 15 Acinar.sorted.bam |bcftools call --threads 15 -mv > Acinar.vcf
samtools view -@ 15 -bS Delta.sam > Delta.bam
samtools sort -@ 15 Delta.bam -o Delta.sorted.bam
samtools index -@ 15  Delta.sorted.bam
bcftools mpileup -Q 30 -A -x -Ou -r MT -f /home/songjia/reference/human/Homo_sapiens.GRCh38.dna.primary_assembly.fa --threads 15 Delta.sorted.bam |bcftools call --threads 15 -mv > Delta.vcf
samtools view -@ 15 -bS Ductal.sam > Ductal.bam
samtools sort -@ 15 Ductal.bam -o Ductal.sorted.bam
samtools index -@ 15  Ductal.sorted.bam
bcftools mpileup -Q 30 -A -x -Ou -r MT -f /home/songjia/reference/human/Homo_sapiens.GRCh38.dna.primary_assembly.fa --threads 15 Ductal.sorted.bam |bcftools call --threads 15 -mv > Ductal.vcf
samtools view -@ 15 -bS Endothelial1.sam > Endothelial1.bam
samtools sort -@ 15 Endothelial1.bam -o Endothelial1.sorted.bam
samtools index -@ 15  Endothelial1.sorted.bam
bcftools mpileup -Q 30 -A -x -Ou -r MT -f /home/songjia/reference/human/Homo_sapiens.GRCh38.dna.primary_assembly.fa --threads 15 Endothelial1.sorted.bam |bcftools call --threads 15 -mv > Endothelial1.vcf
samtools view -@ 15 -bS Endothelial2.sam > Endothelial2.bam
samtools sort -@ 15 Endothelial2.bam -o Endothelial2.sorted.bam
samtools index -@ 15  Endothelial2.sorted.bam
bcftools mpileup -Q 30 -A -x -Ou -r MT -f /home/songjia/reference/human/Homo_sapiens.GRCh38.dna.primary_assembly.fa --threads 15 Endothelial2.sorted.bam |bcftools call --threads 15 -mv > Endothelial2.vcf
samtools view -@ 15 -bS Gamma.sam > Gamma.bam
samtools sort -@ 15 Gamma.bam -o Gamma.sorted.bam
samtools index -@ 15  Gamma.sorted.bam
bcftools mpileup -Q 30 -A -x -Ou -r MT -f /home/songjia/reference/human/Homo_sapiens.GRCh38.dna.primary_assembly.fa --threads 15 Gamma.sorted.bam |bcftools call --threads 15 -mv > Gamma.vcf
cd ../../
cd ./86/86/outs/
samtools view -@ 15 -bS alpha.sam > alpha.bam
samtools sort -@ 15 alpha.bam -o alpha.sorted.bam
samtools index -@ 15  alpha.sorted.bam
bcftools mpileup -Q 30 -A -x -Ou -r MT -f /home/songjia/reference/human/Homo_sapiens.GRCh38.dna.primary_assembly.fa --threads 15 alpha.sorted.bam |bcftools call --threads 15 -mv > alpha.vcf
samtools view -@ 15 -bS beta.sam > beta.bam
samtools sort -@ 15 beta.bam -o beta.sorted.bam
samtools index -@ 15  beta.sorted.bam
bcftools mpileup -Q 30 -A -x -Ou -r MT -f /home/songjia/reference/human/Homo_sapiens.GRCh38.dna.primary_assembly.fa --threads 15 beta.sorted.bam |bcftools call --threads 15 -mv > beta.vcf
samtools view -@ 15 -bS Acinar.sam > Acinar.bam
samtools sort -@ 15 Acinar.bam -o Acinar.sorted.bam
samtools index -@ 15  Acinar.sorted.bam
bcftools mpileup -Q 30 -A -x -Ou -r MT -f /home/songjia/reference/human/Homo_sapiens.GRCh38.dna.primary_assembly.fa --threads 15 Acinar.sorted.bam |bcftools call --threads 15 -mv > Acinar.vcf
samtools view -@ 15 -bS Delta.sam > Delta.bam
samtools sort -@ 15 Delta.bam -o Delta.sorted.bam
samtools index -@ 15  Delta.sorted.bam
bcftools mpileup -Q 30 -A -x -Ou -r MT -f /home/songjia/reference/human/Homo_sapiens.GRCh38.dna.primary_assembly.fa --threads 15 Delta.sorted.bam |bcftools call --threads 15 -mv > Delta.vcf
samtools view -@ 15 -bS Ductal.sam > Ductal.bam
samtools sort -@ 15 Ductal.bam -o Ductal.sorted.bam
samtools index -@ 15  Ductal.sorted.bam
bcftools mpileup -Q 30 -A -x -Ou -r MT -f /home/songjia/reference/human/Homo_sapiens.GRCh38.dna.primary_assembly.fa --threads 15 Ductal.sorted.bam |bcftools call --threads 15 -mv > Ductal.vcf
samtools view -@ 15 -bS Endothelial1.sam > Endothelial1.bam
samtools sort -@ 15 Endothelial1.bam -o Endothelial1.sorted.bam
samtools index -@ 15  Endothelial1.sorted.bam
bcftools mpileup -Q 30 -A -x -Ou -r MT -f /home/songjia/reference/human/Homo_sapiens.GRCh38.dna.primary_assembly.fa --threads 15 Endothelial1.sorted.bam |bcftools call --threads 15 -mv > Endothelial1.vcf
samtools view -@ 15 -bS Endothelial2.sam > Endothelial2.bam
samtools sort -@ 15 Endothelial2.bam -o Endothelial2.sorted.bam
samtools index -@ 15  Endothelial2.sorted.bam
bcftools mpileup -Q 30 -A -x -Ou -r MT -f /home/songjia/reference/human/Homo_sapiens.GRCh38.dna.primary_assembly.fa --threads 15 Endothelial2.sorted.bam |bcftools call --threads 15 -mv > Endothelial2.vcf
samtools view -@ 15 -bS Gamma.sam > Gamma.bam
samtools sort -@ 15 Gamma.bam -o Gamma.sorted.bam
samtools index -@ 15  Gamma.sorted.bam
bcftools mpileup -Q 30 -A -x -Ou -r MT -f /home/songjia/reference/human/Homo_sapiens.GRCh38.dna.primary_assembly.fa --threads 15 Gamma.sorted.bam |bcftools call --threads 15 -mv > Gamma.vcf
cd ../../../
