#! /bin/bash
cd ./12/
cellranger count --id=12 --transcriptome=/home/songjia/reference/mouse/cellranger/Mouse --fastqs=/home/songjia/songjiajia/genome_biology/12 --expect-cells=10000 --localcores=20
cd ./12/outs/
samtools view -h -o aln.sam possorted_genome_bam.bam
gzip -d filtered_feature_bc_matrix/barcodes.tsv.gz
perl ../../../split_sam.pl mIslets_III_A1 ../../../GSE142465_MouseLTI_CellAnnotation_final.tsv filtered_feature_bc_matrix/barcodes.tsv aln.sam >log
cd ../../../
cd ./15/
cellranger count --id=15 --transcriptome=/home/songjia/reference/mouse/cellranger/Mouse --fastqs=/home/songjia/songjiajia/genome_biology/15 --expect-cells=10000 --localcores=20
cd ./15/outs/
samtools view -h -o aln.sam possorted_genome_bam.bam
gzip -d filtered_feature_bc_matrix/barcodes.tsv.gz
perl ../../../split_sam.pl mIslets_III_FoxO ../../../GSE142465_MouseLTI_CellAnnotation_final.tsv filtered_feature_bc_matrix/barcodes.tsv aln.sam >log
cd ../../../
cd ./16/
cellranger count --id=16 --transcriptome=/home/songjia/reference/mouse/cellranger/Mouse --fastqs=/home/songjia/songjiajia/genome_biology/16 --expect-cells=10000 --localcores=20
cd ./16/outs/
samtools view -h -o aln.sam possorted_genome_bam.bam
gzip -d filtered_feature_bc_matrix/barcodes.tsv.gz
perl ../../../split_sam.pl mIslets_III_GABA ../../../GSE142465_MouseLTI_CellAnnotation_final.tsv filtered_feature_bc_matrix/barcodes.tsv aln.sam >log
cd ../../../
