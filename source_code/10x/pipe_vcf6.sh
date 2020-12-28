#! /bin/bash
cd ./12/12/outs/
samtools view -@ 15 -bS alpha.sam > alpha.bam
samtools sort -@ 15 alpha.bam -o alpha.sorted.bam
samtools index -@ 15  alpha.sorted.bam
bcftools mpileup -Q 30 -A -x -Ou -r MT -f /home/songjia/reference/mouse/Mus_musculus.GRCm38.dna.primary_assembly.fa --threads 15 alpha.sorted.bam |bcftools call --threads 15 -mv > 12_alpha.vcf
samtools view -@ 15 -bS beta.sam > beta.bam
samtools sort -@ 15 beta.bam -o beta.sorted.bam
samtools index -@ 15  beta.sorted.bam
bcftools mpileup -Q 30 -A -x -Ou -r MT -f /home/songjia/reference/mouse/Mus_musculus.GRCm38.dna.primary_assembly.fa --threads 15 beta.sorted.bam |bcftools call --threads 15 -mv > 12_beta.vcf
samtools view -@ 15 -bS Acinar.sam > Acinar.bam
samtools sort -@ 15 Acinar.bam -o Acinar.sorted.bam
samtools index -@ 15  Acinar.sorted.bam
bcftools mpileup -Q 30 -A -x -Ou -r MT -f /home/songjia/reference/mouse/Mus_musculus.GRCm38.dna.primary_assembly.fa --threads 15 Acinar.sorted.bam |bcftools call --threads 15 -mv > 12_acinar.vcf
samtools view -@ 15 -bS Delta.sam > Delta.bam
samtools sort -@ 15 Delta.bam -o Delta.sorted.bam
samtools index -@ 15  Delta.sorted.bam
bcftools mpileup -Q 30 -A -x -Ou -r MT -f /home/songjia/reference/mouse/Mus_musculus.GRCm38.dna.primary_assembly.fa --threads 15 Delta.sorted.bam |bcftools call --threads 15 -mv > 12_delta.vcf
samtools view -@ 15 -bS Gamma.sam > Gamma.bam
samtools sort -@ 15 Gamma.bam -o Gamma.sorted.bam
samtools index -@ 15  Gamma.sorted.bam
bcftools mpileup -Q 30 -A -x -Ou -r MT -f /home/songjia/reference/mouse/Mus_musculus.GRCm38.dna.primary_assembly.fa --threads 15 Gamma.sorted.bam |bcftools call --threads 15 -mv > 12_gamma.vcf
cd ../../../
cd ./13/13/outs/
samtools view -@ 15 -bS alpha.sam > alpha.bam
samtools sort -@ 15 alpha.bam -o alpha.sorted.bam
samtools index -@ 15  alpha.sorted.bam
bcftools mpileup -Q 30 -A -x -Ou -r MT -f /home/songjia/reference/mouse/Mus_musculus.GRCm38.dna.primary_assembly.fa --threads 15 alpha.sorted.bam |bcftools call --threads 15 -mv > 13_alpha.vcf
samtools view -@ 15 -bS beta.sam > beta.bam
samtools sort -@ 15 beta.bam -o beta.sorted.bam
samtools index -@ 15  beta.sorted.bam
bcftools mpileup -Q 30 -A -x -Ou -r MT -f /home/songjia/reference/mouse/Mus_musculus.GRCm38.dna.primary_assembly.fa --threads 15 beta.sorted.bam |bcftools call --threads 15 -mv > 13_beta.vcf
samtools view -@ 15 -bS Acinar.sam > Acinar.bam
samtools sort -@ 15 Acinar.bam -o Acinar.sorted.bam
samtools index -@ 15  Acinar.sorted.bam
bcftools mpileup -Q 30 -A -x -Ou -r MT -f /home/songjia/reference/mouse/Mus_musculus.GRCm38.dna.primary_assembly.fa --threads 15 Acinar.sorted.bam |bcftools call --threads 15 -mv > 13_acinar.vcf
samtools view -@ 15 -bS Delta.sam > Delta.bam
samtools sort -@ 15 Delta.bam -o Delta.sorted.bam
samtools index -@ 15  Delta.sorted.bam
bcftools mpileup -Q 30 -A -x -Ou -r MT -f /home/songjia/reference/mouse/Mus_musculus.GRCm38.dna.primary_assembly.fa --threads 15 Delta.sorted.bam |bcftools call --threads 15 -mv > 13_delta.vcf
samtools view -@ 15 -bS Gamma.sam > Gamma.bam
samtools sort -@ 15 Gamma.bam -o Gamma.sorted.bam
samtools index -@ 15  Gamma.sorted.bam
bcftools mpileup -Q 30 -A -x -Ou -r MT -f /home/songjia/reference/mouse/Mus_musculus.GRCm38.dna.primary_assembly.fa --threads 15 Gamma.sorted.bam |bcftools call --threads 15 -mv > 13_gamma.vcf
cd ../../../
cd ./14/14/outs/
samtools view -@ 15 -bS alpha.sam > alpha.bam
samtools sort -@ 15 alpha.bam -o alpha.sorted.bam
samtools index -@ 15  alpha.sorted.bam
bcftools mpileup -Q 30 -A -x -Ou -r MT -f /home/songjia/reference/mouse/Mus_musculus.GRCm38.dna.primary_assembly.fa --threads 15 alpha.sorted.bam |bcftools call --threads 15 -mv > 14_alpha.vcf
samtools view -@ 15 -bS beta.sam > beta.bam
samtools sort -@ 15 beta.bam -o beta.sorted.bam
samtools index -@ 15  beta.sorted.bam
bcftools mpileup -Q 30 -A -x -Ou -r MT -f /home/songjia/reference/mouse/Mus_musculus.GRCm38.dna.primary_assembly.fa --threads 15 beta.sorted.bam |bcftools call --threads 15 -mv > 14_beta.vcf
samtools view -@ 15 -bS Acinar.sam > Acinar.bam
samtools sort -@ 15 Acinar.bam -o Acinar.sorted.bam
samtools index -@ 15  Acinar.sorted.bam
bcftools mpileup -Q 30 -A -x -Ou -r MT -f /home/songjia/reference/mouse/Mus_musculus.GRCm38.dna.primary_assembly.fa --threads 15 Acinar.sorted.bam |bcftools call --threads 15 -mv > 14_acinar.vcf
samtools view -@ 15 -bS Delta.sam > Delta.bam
samtools sort -@ 15 Delta.bam -o Delta.sorted.bam
samtools index -@ 15  Delta.sorted.bam
bcftools mpileup -Q 30 -A -x -Ou -r MT -f /home/songjia/reference/mouse/Mus_musculus.GRCm38.dna.primary_assembly.fa --threads 15 Delta.sorted.bam |bcftools call --threads 15 -mv > 14_delta.vcf
samtools view -@ 15 -bS Gamma.sam > Gamma.bam
samtools sort -@ 15 Gamma.bam -o Gamma.sorted.bam
samtools index -@ 15  Gamma.sorted.bam
bcftools mpileup -Q 30 -A -x -Ou -r MT -f /home/songjia/reference/mouse/Mus_musculus.GRCm38.dna.primary_assembly.fa --threads 15 Gamma.sorted.bam |bcftools call --threads 15 -mv > 14_gamma.vcf
cd ../../../
cd ./15/15/outs/
samtools view -@ 15 -bS alpha.sam > alpha.bam
samtools sort -@ 15 alpha.bam -o alpha.sorted.bam
samtools index -@ 15  alpha.sorted.bam
bcftools mpileup -Q 30 -A -x -Ou -r MT -f /home/songjia/reference/mouse/Mus_musculus.GRCm38.dna.primary_assembly.fa --threads 15 alpha.sorted.bam |bcftools call --threads 15 -mv > 15_alpha.vcf
samtools view -@ 15 -bS beta.sam > beta.bam
samtools sort -@ 15 beta.bam -o beta.sorted.bam
samtools index -@ 15  beta.sorted.bam
bcftools mpileup -Q 30 -A -x -Ou -r MT -f /home/songjia/reference/mouse/Mus_musculus.GRCm38.dna.primary_assembly.fa --threads 15 beta.sorted.bam |bcftools call --threads 15 -mv > 15_beta.vcf
samtools view -@ 15 -bS Acinar.sam > Acinar.bam
samtools sort -@ 15 Acinar.bam -o Acinar.sorted.bam
samtools index -@ 15  Acinar.sorted.bam
bcftools mpileup -Q 30 -A -x -Ou -r MT -f /home/songjia/reference/mouse/Mus_musculus.GRCm38.dna.primary_assembly.fa --threads 15 Acinar.sorted.bam |bcftools call --threads 15 -mv > 15_acinar.vcf
samtools view -@ 15 -bS Delta.sam > Delta.bam
samtools sort -@ 15 Delta.bam -o Delta.sorted.bam
samtools index -@ 15  Delta.sorted.bam
bcftools mpileup -Q 30 -A -x -Ou -r MT -f /home/songjia/reference/mouse/Mus_musculus.GRCm38.dna.primary_assembly.fa --threads 15 Delta.sorted.bam |bcftools call --threads 15 -mv > 15_delta.vcf
samtools view -@ 15 -bS Gamma.sam > Gamma.bam
samtools sort -@ 15 Gamma.bam -o Gamma.sorted.bam
samtools index -@ 15  Gamma.sorted.bam
bcftools mpileup -Q 30 -A -x -Ou -r MT -f /home/songjia/reference/mouse/Mus_musculus.GRCm38.dna.primary_assembly.fa --threads 15 Gamma.sorted.bam |bcftools call --threads 15 -mv > 15_gamma.vcf
cd ../../../
cd ./16/16/outs/
samtools view -@ 15 -bS alpha.sam > alpha.bam
samtools sort -@ 15 alpha.bam -o alpha.sorted.bam
samtools index -@ 15  alpha.sorted.bam
bcftools mpileup -Q 30 -A -x -Ou -r MT -f /home/songjia/reference/mouse/Mus_musculus.GRCm38.dna.primary_assembly.fa --threads 15 alpha.sorted.bam |bcftools call --threads 15 -mv > 16_alpha.vcf
samtools view -@ 15 -bS beta.sam > beta.bam
samtools sort -@ 15 beta.bam -o beta.sorted.bam
samtools index -@ 15  beta.sorted.bam
bcftools mpileup -Q 30 -A -x -Ou -r MT -f /home/songjia/reference/mouse/Mus_musculus.GRCm38.dna.primary_assembly.fa --threads 15 beta.sorted.bam |bcftools call --threads 15 -mv > 16_beta.vcf
samtools view -@ 15 -bS Acinar.sam > Acinar.bam
samtools sort -@ 15 Acinar.bam -o Acinar.sorted.bam
samtools index -@ 15  Acinar.sorted.bam
bcftools mpileup -Q 30 -A -x -Ou -r MT -f /home/songjia/reference/mouse/Mus_musculus.GRCm38.dna.primary_assembly.fa --threads 15 Acinar.sorted.bam |bcftools call --threads 15 -mv > 16_acinar.vcf
samtools view -@ 15 -bS Delta.sam > Delta.bam
samtools sort -@ 15 Delta.bam -o Delta.sorted.bam
samtools index -@ 15  Delta.sorted.bam
bcftools mpileup -Q 30 -A -x -Ou -r MT -f /home/songjia/reference/mouse/Mus_musculus.GRCm38.dna.primary_assembly.fa --threads 15 Delta.sorted.bam |bcftools call --threads 15 -mv > 16_delta.vcf
samtools view -@ 15 -bS Gamma.sam > Gamma.bam
samtools sort -@ 15 Gamma.bam -o Gamma.sorted.bam
samtools index -@ 15  Gamma.sorted.bam
bcftools mpileup -Q 30 -A -x -Ou -r MT -f /home/songjia/reference/mouse/Mus_musculus.GRCm38.dna.primary_assembly.fa --threads 15 Gamma.sorted.bam |bcftools call --threads 15 -mv > 16_gamma.vcf
cd ../../../
