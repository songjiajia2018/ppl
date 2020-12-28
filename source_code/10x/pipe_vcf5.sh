#! /bin/bash
cd ./07/07/outs/
samtools view -@ 15 -bS alpha.sam > alpha.bam
samtools sort -@ 15 alpha.bam -o alpha.sorted.bam
samtools index -@ 15  alpha.sorted.bam
bcftools mpileup -Q 30 -A -x -Ou -r MT -f /home/songjia/reference/mouse/Mus_musculus.GRCm38.dna.primary_assembly.fa --threads 15 alpha.sorted.bam |bcftools call --threads 15 -mv > 07_alpha.vcf
samtools view -@ 15 -bS beta.sam > beta.bam
samtools sort -@ 15 beta.bam -o beta.sorted.bam
samtools index -@ 15  beta.sorted.bam
bcftools mpileup -Q 30 -A -x -Ou -r MT -f /home/songjia/reference/mouse/Mus_musculus.GRCm38.dna.primary_assembly.fa --threads 15 beta.sorted.bam |bcftools call --threads 15 -mv > 07_beta.vcf
samtools view -@ 15 -bS Acinar.sam > Acinar.bam
samtools sort -@ 15 Acinar.bam -o Acinar.sorted.bam
samtools index -@ 15  Acinar.sorted.bam
bcftools mpileup -Q 30 -A -x -Ou -r MT -f /home/songjia/reference/mouse/Mus_musculus.GRCm38.dna.primary_assembly.fa --threads 15 Acinar.sorted.bam |bcftools call --threads 15 -mv > 07_acinar.vcf
samtools view -@ 15 -bS Delta.sam > Delta.bam
samtools sort -@ 15 Delta.bam -o Delta.sorted.bam
samtools index -@ 15  Delta.sorted.bam
bcftools mpileup -Q 30 -A -x -Ou -r MT -f /home/songjia/reference/mouse/Mus_musculus.GRCm38.dna.primary_assembly.fa --threads 15 Delta.sorted.bam |bcftools call --threads 15 -mv > 07_delta.vcf
samtools view -@ 15 -bS Gamma.sam > Gamma.bam
samtools sort -@ 15 Gamma.bam -o Gamma.sorted.bam
samtools index -@ 15  Gamma.sorted.bam
bcftools mpileup -Q 30 -A -x -Ou -r MT -f /home/songjia/reference/mouse/Mus_musculus.GRCm38.dna.primary_assembly.fa --threads 15 Gamma.sorted.bam |bcftools call --threads 15 -mv > 07_gamma.vcf
cd ../../../
cd ./1508/outs/
samtools view -@ 15 -bS alpha.sam > alpha.bam
samtools sort -@ 15 alpha.bam -o alpha.sorted.bam
samtools index -@ 15  alpha.sorted.bam
bcftools mpileup -Q 30 -A -x -Ou -r MT -f /home/songjia/reference/mouse/Mus_musculus.GRCm38.dna.primary_assembly.fa --threads 15 alpha.sorted.bam |bcftools call --threads 15 -mv > 08_alpha.vcf
samtools view -@ 15 -bS beta.sam > beta.bam
samtools sort -@ 15 beta.bam -o beta.sorted.bam
samtools index -@ 15  beta.sorted.bam
bcftools mpileup -Q 30 -A -x -Ou -r MT -f /home/songjia/reference/mouse/Mus_musculus.GRCm38.dna.primary_assembly.fa --threads 15 beta.sorted.bam |bcftools call --threads 15 -mv > 08_beta.vcf
samtools view -@ 15 -bS Acinar.sam > Acinar.bam
samtools sort -@ 15 Acinar.bam -o Acinar.sorted.bam
samtools index -@ 15  Acinar.sorted.bam
bcftools mpileup -Q 30 -A -x -Ou -r MT -f /home/songjia/reference/mouse/Mus_musculus.GRCm38.dna.primary_assembly.fa --threads 15 Acinar.sorted.bam |bcftools call --threads 15 -mv > 08_acinar.vcf
samtools view -@ 15 -bS Delta.sam > Delta.bam
samtools sort -@ 15 Delta.bam -o Delta.sorted.bam
samtools index -@ 15  Delta.sorted.bam
bcftools mpileup -Q 30 -A -x -Ou -r MT -f /home/songjia/reference/mouse/Mus_musculus.GRCm38.dna.primary_assembly.fa --threads 15 Delta.sorted.bam |bcftools call --threads 15 -mv > 08_delta.vcf
samtools view -@ 15 -bS Gamma.sam > Gamma.bam
samtools sort -@ 15 Gamma.bam -o Gamma.sorted.bam
samtools index -@ 15  Gamma.sorted.bam
bcftools mpileup -Q 30 -A -x -Ou -r MT -f /home/songjia/reference/mouse/Mus_musculus.GRCm38.dna.primary_assembly.fa --threads 15 Gamma.sorted.bam |bcftools call --threads 15 -mv > 08_gamma.vcf
cd ../../
cd ./09/09/outs/
samtools view -@ 15 -bS alpha.sam > alpha.bam
samtools sort -@ 15 alpha.bam -o alpha.sorted.bam
samtools index -@ 15  alpha.sorted.bam
bcftools mpileup -Q 30 -A -x -Ou -r MT -f /home/songjia/reference/mouse/Mus_musculus.GRCm38.dna.primary_assembly.fa --threads 15 alpha.sorted.bam |bcftools call --threads 15 -mv > 09_alpha.vcf
samtools view -@ 15 -bS beta.sam > beta.bam
samtools sort -@ 15 beta.bam -o beta.sorted.bam
samtools index -@ 15  beta.sorted.bam
bcftools mpileup -Q 30 -A -x -Ou -r MT -f /home/songjia/reference/mouse/Mus_musculus.GRCm38.dna.primary_assembly.fa --threads 15 beta.sorted.bam |bcftools call --threads 15 -mv > 09_beta.vcf
samtools view -@ 15 -bS Acinar.sam > Acinar.bam
samtools sort -@ 15 Acinar.bam -o Acinar.sorted.bam
samtools index -@ 15  Acinar.sorted.bam
bcftools mpileup -Q 30 -A -x -Ou -r MT -f /home/songjia/reference/mouse/Mus_musculus.GRCm38.dna.primary_assembly.fa --threads 15 Acinar.sorted.bam |bcftools call --threads 15 -mv > 09_acinar.vcf
samtools view -@ 15 -bS Delta.sam > Delta.bam
samtools sort -@ 15 Delta.bam -o Delta.sorted.bam
samtools index -@ 15  Delta.sorted.bam
bcftools mpileup -Q 30 -A -x -Ou -r MT -f /home/songjia/reference/mouse/Mus_musculus.GRCm38.dna.primary_assembly.fa --threads 15 Delta.sorted.bam |bcftools call --threads 15 -mv > 09_delta.vcf
samtools view -@ 15 -bS Gamma.sam > Gamma.bam
samtools sort -@ 15 Gamma.bam -o Gamma.sorted.bam
samtools index -@ 15  Gamma.sorted.bam
bcftools mpileup -Q 30 -A -x -Ou -r MT -f /home/songjia/reference/mouse/Mus_musculus.GRCm38.dna.primary_assembly.fa --threads 15 Gamma.sorted.bam |bcftools call --threads 15 -mv > 09_gamma.vcf
cd ../../../
cd ./10/10/outs/
samtools view -@ 15 -bS alpha.sam > alpha.bam
samtools sort -@ 15 alpha.bam -o alpha.sorted.bam
samtools index -@ 15  alpha.sorted.bam
bcftools mpileup -Q 30 -A -x -Ou -r MT -f /home/songjia/reference/mouse/Mus_musculus.GRCm38.dna.primary_assembly.fa --threads 15 alpha.sorted.bam |bcftools call --threads 15 -mv > 10_alpha.vcf
samtools view -@ 15 -bS beta.sam > beta.bam
samtools sort -@ 15 beta.bam -o beta.sorted.bam
samtools index -@ 15  beta.sorted.bam
bcftools mpileup -Q 30 -A -x -Ou -r MT -f /home/songjia/reference/mouse/Mus_musculus.GRCm38.dna.primary_assembly.fa --threads 15 beta.sorted.bam |bcftools call --threads 15 -mv > 10_beta.vcf
samtools view -@ 15 -bS Acinar.sam > Acinar.bam
samtools sort -@ 15 Acinar.bam -o Acinar.sorted.bam
samtools index -@ 15  Acinar.sorted.bam
bcftools mpileup -Q 30 -A -x -Ou -r MT -f /home/songjia/reference/mouse/Mus_musculus.GRCm38.dna.primary_assembly.fa --threads 15 Acinar.sorted.bam |bcftools call --threads 15 -mv > 10_acinar.vcf
samtools view -@ 15 -bS Delta.sam > Delta.bam
samtools sort -@ 15 Delta.bam -o Delta.sorted.bam
samtools index -@ 15  Delta.sorted.bam
bcftools mpileup -Q 30 -A -x -Ou -r MT -f /home/songjia/reference/mouse/Mus_musculus.GRCm38.dna.primary_assembly.fa --threads 15 Delta.sorted.bam |bcftools call --threads 15 -mv > 10_delta.vcf
samtools view -@ 15 -bS Gamma.sam > Gamma.bam
samtools sort -@ 15 Gamma.bam -o Gamma.sorted.bam
samtools index -@ 15  Gamma.sorted.bam
bcftools mpileup -Q 30 -A -x -Ou -r MT -f /home/songjia/reference/mouse/Mus_musculus.GRCm38.dna.primary_assembly.fa --threads 15 Gamma.sorted.bam |bcftools call --threads 15 -mv > 10_gamma.vcf
cd ../../../
cd ./11/11/outs/
samtools view -@ 15 -bS alpha.sam > alpha.bam
samtools sort -@ 15 alpha.bam -o alpha.sorted.bam
samtools index -@ 15  alpha.sorted.bam
bcftools mpileup -Q 30 -A -x -Ou -r MT -f /home/songjia/reference/mouse/Mus_musculus.GRCm38.dna.primary_assembly.fa --threads 15 alpha.sorted.bam |bcftools call --threads 15 -mv > 11_alpha.vcf
samtools view -@ 15 -bS beta.sam > beta.bam
samtools sort -@ 15 beta.bam -o beta.sorted.bam
samtools index -@ 15  beta.sorted.bam
bcftools mpileup -Q 30 -A -x -Ou -r MT -f /home/songjia/reference/mouse/Mus_musculus.GRCm38.dna.primary_assembly.fa --threads 15 beta.sorted.bam |bcftools call --threads 15 -mv > 11_beta.vcf
samtools view -@ 15 -bS Acinar.sam > Acinar.bam
samtools sort -@ 15 Acinar.bam -o Acinar.sorted.bam
samtools index -@ 15  Acinar.sorted.bam
bcftools mpileup -Q 30 -A -x -Ou -r MT -f /home/songjia/reference/mouse/Mus_musculus.GRCm38.dna.primary_assembly.fa --threads 15 Acinar.sorted.bam |bcftools call --threads 15 -mv > 11_acinar.vcf
samtools view -@ 15 -bS Delta.sam > Delta.bam
samtools sort -@ 15 Delta.bam -o Delta.sorted.bam
samtools index -@ 15  Delta.sorted.bam
bcftools mpileup -Q 30 -A -x -Ou -r MT -f /home/songjia/reference/mouse/Mus_musculus.GRCm38.dna.primary_assembly.fa --threads 15 Delta.sorted.bam |bcftools call --threads 15 -mv > 11_delta.vcf
samtools view -@ 15 -bS Gamma.sam > Gamma.bam
samtools sort -@ 15 Gamma.bam -o Gamma.sorted.bam
samtools index -@ 15  Gamma.sorted.bam
bcftools mpileup -Q 30 -A -x -Ou -r MT -f /home/songjia/reference/mouse/Mus_musculus.GRCm38.dna.primary_assembly.fa --threads 15 Gamma.sorted.bam |bcftools call --threads 15 -mv > 11_gamma.vcf
cd ../../../
