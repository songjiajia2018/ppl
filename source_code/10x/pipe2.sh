#! /bin/bash
cd ./09/
cellranger count --id=09 --transcriptome=/home/songjia/reference/mouse/cellranger/Mouse --fastqs=/home/songjia/songjiajia/genome_biology/09 --expect-cells=10000 --localcores=20
cd ./09/outs/
samtools view -h -o aln.sam possorted_genome_bam.bam
gzip -d filtered_feature_bc_matrix/barcodes.tsv.gz
perl ../../../split_sam.pl mIslets_II_DMS ../../../GSE142465_MouseLTI_CellAnnotation_final.tsv filtered_feature_bc_matrix/barcodes.tsv aln.sam >log
cd ../../../
cd ./07/
cellranger count --id=07 --transcriptome=/home/songjia/reference/mouse/cellranger/Mouse --fastqs=/home/songjia/songjiajia/genome_biology/07 --expect-cells=10000 --localcores=20
cd ./07/outs/
samtools view -h -o aln.sam possorted_genome_bam.bam
gzip -d filtered_feature_bc_matrix/barcodes.tsv.gz
perl ../../../split_sam.pl mIslets_II_A1 ../../../GSE142465_MouseLTI_CellAnnotation_final.tsv filtered_feature_bc_matrix/barcodes.tsv aln.sam >log
cd ../../../
cd ./10/
cellranger count --id=10 --transcriptome=/home/songjia/reference/mouse/cellranger/Mouse --fastqs=/home/songjia/songjiajia/genome_biology/10 --expect-cells=10000 --localcores=20
cd ./10/outs/
samtools view -h -o aln.sam possorted_genome_bam.bam
gzip -d filtered_feature_bc_matrix/barcodes.tsv.gz
perl ../../../split_sam.pl mIslets_II_FoxO ../../../GSE142465_MouseLTI_CellAnnotation_final.tsv filtered_feature_bc_matrix/barcodes.tsv aln.sam >log
cd ../../../
cd ./11/
cellranger count --id=11 --transcriptome=/home/songjia/reference/mouse/cellranger/Mouse --fastqs=/home/songjia/songjiajia/genome_biology/11 --expect-cells=10000 --localcores=20
cd ./11/outs/
samtools view -h -o aln.sam possorted_genome_bam.bam
gzip -d filtered_feature_bc_matrix/barcodes.tsv.gz
perl ../../../split_sam.pl mIslets_II_GABA ../../../GSE142465_MouseLTI_CellAnnotation_final.tsv filtered_feature_bc_matrix/barcodes.tsv aln.sam >log
cd ../../../
cd ./03/
cellranger count --id=03 --transcriptome=/home/songjia/reference/mouse/cellranger/Mouse --fastqs=/home/songjia/songjiajia/genome_biology/03 --expect-cells=10000 --localcores=20
cd ./03/outs/
samtools view -h -o aln.sam possorted_genome_bam.bam
gzip -d filtered_feature_bc_matrix/barcodes.tsv.gz
perl ../../../split_sam.pl mIslets_I_A10 ../../../GSE142465_MouseLTI_CellAnnotation_final.tsv filtered_feature_bc_matrix/barcodes.tsv aln.sam >log
cd ../../../
cd ./13/
cellranger count --id=13 --transcriptome=/home/songjia/reference/mouse/cellranger/Mouse --fastqs=/home/songjia/songjiajia/genome_biology/13 --expect-cells=10000 --localcores=20
cd ./13/outs/
samtools view -h -o aln.sam possorted_genome_bam.bam
gzip -d filtered_feature_bc_matrix/barcodes.tsv.gz
perl ../../../split_sam.pl mIslets_III_A10 ../../../GSE142465_MouseLTI_CellAnnotation_final.tsv filtered_feature_bc_matrix/barcodes.tsv aln.sam >log
cd ../../../
