#! /bin/bash
cd ./02/
cellranger count --id=02 --transcriptome=/home/songjia/reference/mouse/cellranger/Mouse --fastqs=/home/songjia/songjiajia/genome_biology/02 --expect-cells=10000 --localcores=20
cd ./02/outs/
samtools view -h -o aln.sam possorted_genome_bam.bam
gzip -d filtered_feature_bc_matrix/barcodes.tsv.gz
perl ../../../split_sam.pl mIslets_I_A1 ../../../GSE142465_MouseLTI_CellAnnotation_final.tsv filtered_feature_bc_matrix/barcodes.tsv aln.sam >log
cd ../../../
cd ./04/
cellranger count --id=04 --transcriptome=/home/songjia/reference/mouse/cellranger/Mouse --fastqs=/home/songjia/songjiajia/genome_biology/04 --expect-cells=10000 --localcores=20
cd ./04/outs/
samtools view -h -o aln.sam possorted_genome_bam.bam
gzip -d filtered_feature_bc_matrix/barcodes.tsv.gz
perl ../../../split_sam.pl mIslets_I_DMSO ../../../GSE142465_MouseLTI_CellAnnotation_final.tsv filtered_feature_bc_matrix/barcodes.tsv aln.sam >log
cd ../../../
cd ./05/
cellranger count --id=05 --transcriptome=/home/songjia/reference/mouse/cellranger/Mouse --fastqs=/home/songjia/songjiajia/genome_biology/05 --expect-cells=10000 --localcores=20
cd ./05/outs/
samtools view -h -o aln.sam possorted_genome_bam.bam
gzip -d filtered_feature_bc_matrix/barcodes.tsv.gz
perl ../../../split_sam.pl mIslets_I_FoxO ../../../GSE142465_MouseLTI_CellAnnotation_final.tsv filtered_feature_bc_matrix/barcodes.tsv aln.sam >log
cd ../../../
cd ./06/
cellranger count --id=06 --transcriptome=/home/songjia/reference/mouse/cellranger/Mouse --fastqs=/home/songjia/songjiajia/genome_biology/06 --expect-cells=10000 --localcores=20
cd ./06/outs/
samtools view -h -o aln.sam possorted_genome_bam.bam
gzip -d filtered_feature_bc_matrix/barcodes.tsv.gz
perl ../../../split_sam.pl mIslets_I_GABA ../../../GSE142465_MouseLTI_CellAnnotation_final.tsv filtered_feature_bc_matrix/barcodes.tsv aln.sam >log
cd ../../../
cd ./90/
cellranger count --id=90 --transcriptome=/home/songjia/reference/human/cellranger/GRCh38 --fastqs=/home/songjia/songjiajia/genome_biology/90 --expect-cells=10000 --localcores=20
cd ./90/outs/
samtools view -h -o aln.sam possorted_genome_bam.bam
gzip -d filtered_feature_bc_matrix/barcodes.tsv.gz
perl ../../../split_sam.pl hIslets_II_FoxO ../../../GSE142465_Human3_CellAnnotation_final.tsv filtered_feature_bc_matrix/barcodes.tsv  aln.sam >log
cd ../../../
cd ./92/
cellranger count --id=92 --transcriptome=/home/songjia/reference/human/cellranger/GRCh38 --fastqs=/home/songjia/songjiajia/genome_biology/92 --expect-cells=10000 --localcores=20
cd ./92/outs/
samtools view -h -o aln.sam possorted_genome_bam.bam
gzip -d filtered_feature_bc_matrix/barcodes.tsv.gz
perl ../../../split_sam.pl hIslets_III_A10_36_1 ../../../GSE142465_Human3_CellAnnotation_final.tsv filtered_feature_bc_matrix/barcodes.tsv  aln.sam >log
cd ../../../
cd ./01/
cellranger count --id=01 --transcriptome=/home/songjia/reference/human/cellranger/GRCh38 --fastqs=/home/songjia/songjiajia/genome_biology/01 --expect-cells=10000 --localcores=20
cd ./01/outs/
samtools view -h -o aln.sam possorted_genome_bam.bam
gzip -d filtered_feature_bc_matrix/barcodes.tsv.gz
perl ../../../split_sam.pl hIslets_III_DMSO_72_3 ../../../GSE142465_Human3_CellAnnotation_final.tsv filtered_feature_bc_matrix/barcodes.tsv  aln.sam >log
cd ../../../
