#! /bin/bash
cd ./87/87/outs/
gzip -d filtered_feature_bc_matrix/barcodes.tsv.gz
perl ../../../split_sam.pl hIslets_II_Aold ../../../GSE142465_Human1_2_CellAnnotation_final.tsv filtered_feature_bc_matrix/barcodes.tsv aln.sam >log
cd ../../../
cd ./89/89/outs/
gzip -d filtered_feature_bc_matrix/barcodes.tsv.gz
perl ../../../split_sam.pl hIslets_II_DMSO ../../../GSE142465_Human1_2_CellAnnotation_final.tsv filtered_feature_bc_matrix/barcodes.tsv aln.sam >log
cd ../../../
cd ./88/88/outs/
gzip -d filtered_feature_bc_matrix/barcodes.tsv.gz
perl ../../../split_sam.pl hIslets_II_A10 ../../../GSE142465_Human1_2_CellAnnotation_final.tsv filtered_feature_bc_matrix/barcodes.tsv aln.sam >log
cd ../../../
cd ./85/outs/
gzip -d filtered_feature_bc_matrix/barcodes.tsv.gz
perl ../../../split_sam.pl hIslets_I_FoxO ../../../GSE142465_Human1_2_CellAnnotation_final.tsv filtered_feature_bc_matrix/barcodes.tsv aln.sam >log
cd ../../
cd ./86/86/outs/
gzip -d filtered_feature_bc_matrix/barcodes.tsv.gz
perl ../../../split_sam.pl hIslets_I_GABA ../../../GSE142465_Human1_2_CellAnnotation_final.tsv filtered_feature_bc_matrix/barcodes.tsv aln.sam >log
cd ../../../
cd ./83/83/outs/
gzip -d filtered_feature_bc_matrix/barcodes.tsv.gz
perl ../../../split_sam.pl hIslets_I_A10 ../../../GSE142465_Human1_2_CellAnnotation_final.tsv filtered_feature_bc_matrix/barcodes.tsv aln.sam >log
cd ../../../
