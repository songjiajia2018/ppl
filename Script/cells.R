#!/usr/bin/Rscript
args<-commandArgs(T)
## rds file
raw_file=as.character(args[1])
## cell type annotation file
annotation=as.character(args[2])
## n thread used
thread=as.numeric(args[3])
print(raw_file)
print(annotation)


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
        a=master_df[master_df$position==i,(2*num+1):(3*num)]
        b=master_df[master_df$position==i,(num+1):(2*num)]
        if(median(melt(a)$value)<30 & median(melt(b)$value)<20 ){
                master_df2=master_df2[-i,]
        }
}
write.table(master_df2,file="master.txt")

####read in cell group information
annotation=read.table(annotation)
types=c()
nu=1
for(i in names(master_df2)){
	types[nu]=annotation[annotation$V1==i,]$V2
	nu=nu+1
}
b=types
b1=as.character(types)


######plot 1: high variants sites
library("ggplot2")
library("Rtsne")
df=master_df2

sds=apply(df,1,sd)
a=order(sds,decreasing=T)
df=df[a[1:10],]
t=Rtsne(t(df),perplexity=15,check_duplicates =F)
ty=as.data.frame(t$Y)
ty$label=b1
names(ty)=c("TSNE 1","TSNE 2","Label")
write.table(ty,file="high_variant.txt")
pdf(file="high_variants_tsne.pdf")
ggplot(data=ty,aes(x=`TSNE 1`,y=`TSNE 2`,fill=Label,color=Label))+geom_point()+theme_bw()+theme(panel.border=element_blank(),panel.grid.major=element_blank(),panel.grid.minor=element_blank(),axis.line=element_line(color="black"))
dev.off()

#####plot 2: makers sites
library(parallel)
my_test<-function(i){
        f=data[i,]
        library("pROC")
        comp=data.frame(t(f),ncluster)
        names(comp)=c("f","ncluster")
        roc1=roc(comp$ncluster,comp$f)
        auc1=as.numeric(roc1$auc)
        corr=abs(as.numeric(cor(comp$ncluster,comp$f)[[1]]))
        result=data.frame(auc1,corr,name2[i])
        row.names(result)=name2[i]
        return(result)
}

data=master_df2
cl <- makeCluster(getOption("cl.cores", thread))
name2=row.names(data)
all.markers=list()
gmarkers=c()
ncluster=as.numeric(b)
ncluster[ncluster!=1]=0
clusterExport(cl,"data",envir = environment())
clusterExport(cl,"ncluster",envir = environment())
clusterExport(cl,"name2",envir = environment())
num=dim(data)[1]
nums=1:num
marker=parLapply(cl,nums,my_test)
markers=do.call(rbind,marker)
markers=as.data.frame(markers)
stopCluster(cl)
a=order(markers$auc1,decreasing=T)
data=data[a[1:10],]
b2=as.character(b)
t=Rtsne(t(data),perplexity=15,check_duplicates =F)
ty=as.data.frame(t$Y)
ty$label=b2
names(ty)=c("TSNE 1","TSNE 2","Label")
pdf(file="markers_tsne.pdf")
ggplot(data=ty,aes(x=`TSNE 1`,y=`TSNE 2`,fill=Label,color=Label))+geom_point()+theme_bw()+theme(panel.border=element_blank(),panel.grid.major=element_blank(),panel.grid.minor=element_blank(),axis.line=element_line(color="black"))
dev.off()


