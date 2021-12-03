# !/usr/bin/Rscript
args<-commandArgs(T)

## rds file
raw_file=as.character(args[1])

library(MultiAssayExperiment)
library(Matrix)
library("reshape2")
library("gplots")
library("ggplot2")
library("Rtsne")
library(pheatmap)
library(RColorBrewer)

"%ni%" <- Negate("%in%")
raw <- readRDS(raw_file)

covSE <- raw[["coverage"]]
allSE <- raw[["alleles"]]
# baq <- assays(allSE)[["BAQ"]]
rm(raw)

## Allele Frequency
af <- assays(allSE)[["counts"]]/(assays(covSE)[["coverage"]][start(rowRanges(allSE)),] + 0.001)
rownames(af) <- paste0(data.frame(rowRanges(allSE))[,c(2)], "_", data.frame(rowRanges(allSE))[,c(7)])
mtmatrix <- data.frame(data.matrix(af))
mtmatrix$altAllele <- data.frame(rowRanges(allSE))[,c(7)]
mtmatrix$refAllele <- data.frame(rowRanges(allSE))[,c(6)]
write.table(mtmatrix,file="mtMatrix.txt")

# cov <- assays(covSE)[["coverage"]][start(rowRanges(allSE)),]
# master_df <- data.frame(cbind(data.matrix(af), data.matrix(cov), data.matrix(baq)))
# master_df$position <- data.frame(rowRanges(allSE))[,c(2)]
# master_df$altAllele <- data.frame(rowRanges(allSE))[,c(7)]
# master_df$refAllele <- data.frame(rowRanges(allSE))[,c(6)]
# write.table(master_df,file="master_df.txt")
