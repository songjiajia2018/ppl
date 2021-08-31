# !/usr/bin/Rscript
args <- commandArgs(T)
# rds file
raw_file <- as.character(args[1])

library(MultiAssayExperiment)
library(Matrix)
library("reshape2")

"%ni%" <- Negate("%in%")
raw <- readRDS(raw_file)

covSE <- raw[["coverage"]]
allSE <- raw[["alleles"]]
rm(raw)

# Allele Frequency
af <- assays(allSE)[["counts"]]/(assays(covSE)[["coverage"]][start(rowRanges(allSE)),] + 0.001)
rownames(af) <- paste0(data.frame(rowRanges(allSE))[,c(2)], "_", data.frame(rowRanges(allSE))[,c(7)])
master_af <- data.frame(data.matrix(af))
master_af$altAllele <- data.frame(rowRanges(allSE))[,c(7)]
master_af$refAllele <- data.frame(rowRanges(allSE))[,c(6)]

write.table(master_af,file="master_af.txt",sep='\t')
