#! /bin/bash
cd ./99/
cellranger count --id=99 --transcriptome=/home/songjia/reference/human/cellranger/GRCh38 --fastqs=/home/songjia/songjiajia/genome_biology/99 --expect-cells=10000 --localcores=20
cd ./99/outs/
samtools view -h -o aln.sam possorted_genome_bam.bam
gzip -d filtered_feature_bc_matrix/barcodes.tsv.gz
perl ../../../split_sam.pl hIslets_III_DMSO_36_2 ../../../GSE142465_Human3_CellAnnotation_final.tsv filtered_feature_bc_matrix/barcodes.tsv  aln.sam >log
cd ../../../
cd ./94/
cellranger count --id=94 --transcriptome=/home/songjia/reference/human/cellranger/GRCh38 --fastqs=/home/songjia/songjiajia/genome_biology/94 --expect-cells=10000 --localcores=20
cd ./94/outs/
samtools view -h -o aln.sam possorted_genome_bam.bam
gzip -d filtered_feature_bc_matrix/barcodes.tsv.gz
perl ../../../split_sam.pl hIslets_III_A10_36_2 ../../../GSE142465_Human3_CellAnnotation_final.tsv filtered_feature_bc_matrix/barcodes.tsv aln.sam >log
cd ../../../
cd ./95/
cellranger count --id=95 --transcriptome=/home/songjia/reference/human/cellranger/GRCh38 --fastqs=/home/songjia/songjiajia/genome_biology/95 --expect-cells=10000 --localcores=20
cd ./95/outs/
samtools view -h -o aln.sam possorted_genome_bam.bam
gzip -d filtered_feature_bc_matrix/barcodes.tsv.gz
perl ../../../split_sam.pl hIslets_III_A10_72_2 ../../../GSE142465_Human3_CellAnnotation_final.tsv filtered_feature_bc_matrix/barcodes.tsv aln.sam >log
cd ../../../
cd ./96
cellranger count --id=96 --transcriptome=/home/songjia/reference/human/cellranger/GRCh38 --fastqs=/home/songjia/songjiajia/genome_biology/96 --expect-cells=10000 --localcores=20
cd ./96/outs/
samtools view -h -o aln.sam possorted_genome_bam.bam
gzip -d filtered_feature_bc_matrix/barcodes.tsv.gz
perl ../../../split_sam.pl hIslets_III_A10_72_3 ../../../GSE142465_Human3_CellAnnotation_final.tsv filtered_feature_bc_matrix/barcodes.tsv aln.sam >log
cd ../../../
cd ./83
cellranger count --id=83 --transcriptome=/home/songjia/reference/human/cellranger/GRCh38 --fastqs=/home/songjia/songjiajia/genome_biology/83 --expect-cells=10000 --localcores=20
cd ./83/outs/
samtools view -h -o aln.sam possorted_genome_bam.bam
gzip -d filtered_feature_bc_matrix/barcodes.tsv.gz
perl ../../../split_sam.pl hIslets_I_A10 ../../../GSE142465_Human1_2_CellAnnotation_final.tsv filtered_feature_bc_matrix/barcodes.tsv aln.sam >log
