#!/usr/bin/Rscript
args<-commandArgs(T)
## rds file
raw_file=as.character(args[1])
## cell type annotation file
pair_info=as.character(args[2])
## n thread used
print(raw_file)
print(pair_info)

library(MultiAssayExperiment)
library(Matrix)
library("reshape2")
library("gplots")

"%ni%" <- Negate("%in%")
raw <- readRDS(raw_file)

covSE <- raw[["coverage"]]
allSE <- raw[["alleles"]]
baq <- assays(allSE)[["BAQ"]]
rm(raw)
covCell <-  Matrix::colMeans(assays(covSE)[["coverage"]])

# Allele Frequency
af <- assays(allSE)[["counts"]]/(assays(covSE)[["coverage"]][start(rowRanges(allSE)),] + 0.001)
rownames(af) <- paste0(data.frame(rowRanges(allSE))[,c(2)], "_", data.frame(rowRanges(allSE))[,c(7)])
cov <- assays(covSE)[["coverage"]][start(rowRanges(allSE)),]

master_df <- data.frame(cbind(data.matrix(af), data.matrix(cov), data.matrix(baq)))
master_df$position <- data.frame(rowRanges(allSE))[,c(2)]
master_df$altAllele <- data.frame(rowRanges(allSE))[,c(7)]
master_df$refAllele <- data.frame(rowRanges(allSE))[,c(6)]
pos=unique(master_df$position)


## quanlity control
num=dim(master_df)[2]/3-1
master_df2=master_df[,1:num]
for(i in pos){
        a=master_df[master_df$position==i,(num*2+1):(num*3)]
        b=master_df[master_df$position==i,(num+1):(num*2)]
        if(median(melt(a)$value)<30 & median(melt(b)$value)<20 ){
                master_df2=master_df2[-i,]
        }
}
write.table(master_df2,file="master.txt")

######plot 1: high variants sites
df1=master_df2
sds=apply(df1,1,sd)
df1=df1[sds>0.3,]
pdf(file="high_variants_tsne.pdf")
heatmap.2(as.matrix(df1),col = colorRampPalette(c("blue","white","red"))(256),key=TRUE,symkey=FALSE,density.info="none",trace="none",scale="row",cexRow=0.4,cexCol=0.8)
dev.off()

#####plot 2: makers sites
df1=master_df2
pairs <- as.character(unlist(strsplit(pair_info, split = ":")))
for(i in pairs){
	cols=as.character(unlist(strsplit(i, split = ",")))
	df1=df1[abs(df1[,cols[1]]-df1[,cols[2]])>0.05,]
}
pdf(file="markers_tsne.pdf")
heatmap.2(as.matrix(df1),col = colorRampPalette(c("blue","white","red"))(256),key=TRUE,symkey=FALSE,density.info="none",trace="none",scale="row",cexRow=0.4,cexCol=0.8)
dev.off()
