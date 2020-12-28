#! /bin/bash
samtools view -@ 15 -bS alpha.sam > alpha.bam
samtools sort -@ 15 alpha.bam -o alpha.sorted.bam
samtools index -@ 15  alpha.sorted.bam
bcftools mpileup -Q 30 -A -x -Ou -r MT -f /home/songjia/reference/mouse/Mus_musculus.GRCm38.dna.primary_assembly.fa --threads 15 alpha.sorted.bam |bcftools call --threads 15 -mv > alpha.vcf
samtools view -@ 15 -bS beta.sam > beta.bam
samtools sort -@ 15 beta.bam -o beta.sorted.bam
samtools index -@ 15 beta.sorted.bam
bcftools mpileup -Q 30 -A -x -Ou -r MT -f /home/songjia/reference/mouse/Mus_musculus.GRCm38.dna.primary_assembly.fa --threads 15 beta.sorted.bam |bcftools call --threads 15 -mv > beta.vcf
samtools view -@ 15 -bS Acinar.sam > Acinar.bam
samtools sort -@ 15 Acinar.bam -o Acinar.sorted.bam
samtools index -@ 15 Acinar.sorted.bam
bcftools mpileup -Q 30 -A -x -Ou -r MT -f /home/songjia/reference/mouse/Mus_musculus.GRCm38.dna.primary_assembly.fa --threads 15 Acinar.sorted.bam |bcftools call --threads 15 -mv > Acinar.vcf
samtools view -@ 15 -bS Delta.sam > Delta.bam
samtools sort -@ 15 Delta.bam -o Delta.sorted.bam
samtools index -@ 15 Delta.sorted.bam
bcftools mpileup -Q 30 -A -x -Ou -r MT -f /home/songjia/reference/mouse/Mus_musculus.GRCm38.dna.primary_assembly.fa --threads 15 Delta.sorted.bam |bcftools call --threads 15 -mv > Delta.vcf
samtools view -@ 15 -bS Gamma.sam > Gamma.bam
samtools sort -@ 15 Gamma.bam -o Gamma.sorted.bam
samtools index -@ 15 Gamma.sorted.bam
bcftools mpileup -Q 30 -A -x -Ou -r MT -f /home/songjia/reference/mouse/Mus_musculus.GRCm38.dna.primary_assembly.fa --threads 15 Gamma.sorted.bam |bcftools call --threads 15 -mv > Gamma.vcf

cd ./04/04/outs/
samtools view -@ 15 -bS alpha.sam > alpha.bam
samtools sort -@ 15 alpha.bam -o alpha.sorted.bam
samtools index -@ 15  alpha.sorted.bam
bcftools mpileup -Q 30 -A -x -Ou -r MT -f /home/songjia/reference/mouse/Mus_musculus.GRCm38.dna.primary_assembly.fa --threads 15 alpha.sorted.bam |bcftools call --threads 15 -mv > 04_alpha.vcf
samtools view -@ 15 -bS beta.sam > beta.bam
samtools sort -@ 15 beta.bam -o beta.sorted.bam
samtools index -@ 15  beta.sorted.bam
bcftools mpileup -Q 30 -A -x -Ou -r MT -f /home/songjia/reference/mouse/Mus_musculus.GRCm38.dna.primary_assembly.fa --threads 15 beta.sorted.bam |bcftools call --threads 15 -mv > 04_beta.vcf
samtools view -@ 15 -bS Acinar.sam > Acinar.bam
samtools sort -@ 15 Acinar.bam -o Acinar.sorted.bam
samtools index -@ 15  Acinar.sorted.bam
bcftools mpileup -Q 30 -A -x -Ou -r MT -f /home/songjia/reference/mouse/Mus_musculus.GRCm38.dna.primary_assembly.fa --threads 15 Acinar.sorted.bam |bcftools call --threads 15 -mv > 04_acinar.vcf
samtools view -@ 15 -bS Delta.sam > Delta.bam
samtools sort -@ 15 Delta.bam -o Delta.sorted.bam
samtools index -@ 15  Delta.sorted.bam
bcftools mpileup -Q 30 -A -x -Ou -r MT -f /home/songjia/reference/mouse/Mus_musculus.GRCm38.dna.primary_assembly.fa --threads 15 Delta.sorted.bam |bcftools call --threads 15 -mv > 04_delta.vcf
samtools view -@ 15 -bS Gamma.sam > Gamma.bam
samtools sort -@ 15 Gamma.bam -o Gamma.sorted.bam
samtools index -@ 15  Gamma.sorted.bam
bcftools mpileup -Q 30 -A -x -Ou -r MT -f /home/songjia/reference/mouse/Mus_musculus.GRCm38.dna.primary_assembly.fa --threads 15 Gamma.sorted.bam |bcftools call --threads 15 -mv > 04_gamma.vcf
cd ../../../
cd ./02/02/outs/
samtools view -@ 15 -bS alpha.sam > alpha.bam
samtools sort -@ 15 alpha.bam -o alpha.sorted.bam
samtools index -@ 15  alpha.sorted.bam
bcftools mpileup -Q 30 -A -x -Ou -r MT -f /home/songjia/reference/mouse/Mus_musculus.GRCm38.dna.primary_assembly.fa --threads 15 alpha.sorted.bam |bcftools call --threads 15 -mv > 02_alpha.vcf
samtools view -@ 15 -bS beta.sam > beta.bam
samtools sort -@ 15 beta.bam -o beta.sorted.bam
samtools index -@ 15  beta.sorted.bam
bcftools mpileup -Q 30 -A -x -Ou -r MT -f /home/songjia/reference/mouse/Mus_musculus.GRCm38.dna.primary_assembly.fa --threads 15 beta.sorted.bam |bcftools call --threads 15 -mv > 02_beta.vcf
samtools view -@ 15 -bS Acinar.sam > Acinar.bam
samtools sort -@ 15 Acinar.bam -o Acinar.sorted.bam
samtools index -@ 15  Acinar.sorted.bam
bcftools mpileup -Q 30 -A -x -Ou -r MT -f /home/songjia/reference/mouse/Mus_musculus.GRCm38.dna.primary_assembly.fa --threads 15 Acinar.sorted.bam |bcftools call --threads 15 -mv > 02_acinar.vcf
samtools view -@ 15 -bS Delta.sam > Delta.bam
samtools sort -@ 15 Delta.bam -o Delta.sorted.bam
samtools index -@ 15  Delta.sorted.bam
bcftools mpileup -Q 30 -A -x -Ou -r MT -f /home/songjia/reference/mouse/Mus_musculus.GRCm38.dna.primary_assembly.fa --threads 15 Delta.sorted.bam |bcftools call --threads 15 -mv > 02_delta.vcf
samtools view -@ 15 -bS Gamma.sam > Gamma.bam
samtools sort -@ 15 Gamma.bam -o Gamma.sorted.bam
samtools index -@ 15  Gamma.sorted.bam
bcftools mpileup -Q 30 -A -x -Ou -r MT -f /home/songjia/reference/mouse/Mus_musculus.GRCm38.dna.primary_assembly.fa --threads 15 Gamma.sorted.bam |bcftools call --threads 15 -mv > 02_gamma.vcf
cd ../../../
cd ./03/03/outs/
samtools view -@ 15 -bS alpha.sam > alpha.bam
samtools sort -@ 15 alpha.bam -o alpha.sorted.bam
samtools index -@ 15  alpha.sorted.bam
bcftools mpileup -Q 30 -A -x -Ou -r MT -f /home/songjia/reference/mouse/Mus_musculus.GRCm38.dna.primary_assembly.fa --threads 15 alpha.sorted.bam |bcftools call --threads 15 -mv > 03_alpha.vcf
samtools view -@ 15 -bS beta.sam > beta.bam
samtools sort -@ 15 beta.bam -o beta.sorted.bam
samtools index -@ 15  beta.sorted.bam
bcftools mpileup -Q 30 -A -x -Ou -r MT -f /home/songjia/reference/mouse/Mus_musculus.GRCm38.dna.primary_assembly.fa --threads 15 beta.sorted.bam |bcftools call --threads 15 -mv > 03_beta.vcf
samtools view -@ 15 -bS Acinar.sam > Acinar.bam
samtools sort -@ 15 Acinar.bam -o Acinar.sorted.bam
samtools index -@ 15  Acinar.sorted.bam
bcftools mpileup -Q 30 -A -x -Ou -r MT -f /home/songjia/reference/mouse/Mus_musculus.GRCm38.dna.primary_assembly.fa --threads 15 Acinar.sorted.bam |bcftools call --threads 15 -mv > 03_acinar.vcf
samtools view -@ 15 -bS Delta.sam > Delta.bam
samtools sort -@ 15 Delta.bam -o Delta.sorted.bam
samtools index -@ 15  Delta.sorted.bam
bcftools mpileup -Q 30 -A -x -Ou -r MT -f /home/songjia/reference/mouse/Mus_musculus.GRCm38.dna.primary_assembly.fa --threads 15 Delta.sorted.bam |bcftools call --threads 15 -mv > 03_delta.vcf
samtools view -@ 15 -bS Gamma.sam > Gamma.bam
samtools sort -@ 15 Gamma.bam -o Gamma.sorted.bam
samtools index -@ 15  Gamma.sorted.bam
bcftools mpileup -Q 30 -A -x -Ou -r MT -f /home/songjia/reference/mouse/Mus_musculus.GRCm38.dna.primary_assembly.fa --threads 15 Gamma.sorted.bam |bcftools call --threads 15 -mv > 03_gamma.vcf
cd ../../../
cd ./05/05/outs/
samtools view -@ 15 -bS alpha.sam > alpha.bam
samtools sort -@ 15 alpha.bam -o alpha.sorted.bam
samtools index -@ 15  alpha.sorted.bam
bcftools mpileup -Q 30 -A -x -Ou -r MT -f /home/songjia/reference/mouse/Mus_musculus.GRCm38.dna.primary_assembly.fa --threads 15 alpha.sorted.bam |bcftools call --threads 15 -mv > 05_alpha.vcf
samtools view -@ 15 -bS beta.sam > beta.bam
samtools sort -@ 15 beta.bam -o beta.sorted.bam
samtools index -@ 15  beta.sorted.bam
bcftools mpileup -Q 30 -A -x -Ou -r MT -f /home/songjia/reference/mouse/Mus_musculus.GRCm38.dna.primary_assembly.fa --threads 15 beta.sorted.bam |bcftools call --threads 15 -mv > 05_beta.vcf
samtools view -@ 15 -bS Acinar.sam > Acinar.bam
samtools sort -@ 15 Acinar.bam -o Acinar.sorted.bam
samtools index -@ 15  Acinar.sorted.bam
bcftools mpileup -Q 30 -A -x -Ou -r MT -f /home/songjia/reference/mouse/Mus_musculus.GRCm38.dna.primary_assembly.fa --threads 15 Acinar.sorted.bam |bcftools call --threads 15 -mv > 05_acinar.vcf
samtools view -@ 15 -bS Delta.sam > Delta.bam
samtools sort -@ 15 Delta.bam -o Delta.sorted.bam
samtools index -@ 15  Delta.sorted.bam
bcftools mpileup -Q 30 -A -x -Ou -r MT -f /home/songjia/reference/mouse/Mus_musculus.GRCm38.dna.primary_assembly.fa --threads 15 Delta.sorted.bam |bcftools call --threads 15 -mv > 05_delta.vcf
samtools view -@ 15 -bS Gamma.sam > Gamma.bam
samtools sort -@ 15 Gamma.bam -o Gamma.sorted.bam
samtools index -@ 15  Gamma.sorted.bam
bcftools mpileup -Q 30 -A -x -Ou -r MT -f /home/songjia/reference/mouse/Mus_musculus.GRCm38.dna.primary_assembly.fa --threads 15 Gamma.sorted.bam |bcftools call --threads 15 -mv > 05_gamma.vcf
cd ../../../
cd ./06/06/outs/
samtools view -@ 15 -bS alpha.sam > alpha.bam
samtools sort -@ 15 alpha.bam -o alpha.sorted.bam
samtools index -@ 15  alpha.sorted.bam
bcftools mpileup -Q 30 -A -x -Ou -r MT -f /home/songjia/reference/mouse/Mus_musculus.GRCm38.dna.primary_assembly.fa --threads 15 alpha.sorted.bam |bcftools call --threads 15 -mv > 06_alpha.vcf
samtools view -@ 15 -bS beta.sam > beta.bam
samtools sort -@ 15 beta.bam -o beta.sorted.bam
samtools index -@ 15  beta.sorted.bam
bcftools mpileup -Q 30 -A -x -Ou -r MT -f /home/songjia/reference/mouse/Mus_musculus.GRCm38.dna.primary_assembly.fa --threads 15 beta.sorted.bam |bcftools call --threads 15 -mv > 06_beta.vcf
samtools view -@ 15 -bS Acinar.sam > Acinar.bam
samtools sort -@ 15 Acinar.bam -o Acinar.sorted.bam
samtools index -@ 15  Acinar.sorted.bam
bcftools mpileup -Q 30 -A -x -Ou -r MT -f /home/songjia/reference/mouse/Mus_musculus.GRCm38.dna.primary_assembly.fa --threads 15 Acinar.sorted.bam |bcftools call --threads 15 -mv > 06_acinar.vcf
samtools view -@ 15 -bS Delta.sam > Delta.bam
samtools sort -@ 15 Delta.bam -o Delta.sorted.bam
samtools index -@ 15  Delta.sorted.bam
bcftools mpileup -Q 30 -A -x -Ou -r MT -f /home/songjia/reference/mouse/Mus_musculus.GRCm38.dna.primary_assembly.fa --threads 15 Delta.sorted.bam |bcftools call --threads 15 -mv > 06_delta.vcf
samtools view -@ 15 -bS Gamma.sam > Gamma.bam
samtools sort -@ 15 Gamma.bam -o Gamma.sorted.bam
samtools index -@ 15  Gamma.sorted.bam
bcftools mpileup -Q 30 -A -x -Ou -r MT -f /home/songjia/reference/mouse/Mus_musculus.GRCm38.dna.primary_assembly.fa --threads 15 Gamma.sorted.bam |bcftools call --threads 15 -mv > 06_gamma.vcf
cd ../../../
