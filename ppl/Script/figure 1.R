master_df2=read.table("master_df2.txt", header=T)
name=read.table("cell_delt.txt")
b=name$V2
b=as.character(b)
b[b=="alpha"]=1
b[b=="beta"]=2
donor=unique(name$V3)
df1=master_df2[,name$V3=="21yr_male"]
df2=master_df2[,name$V3=="38yr_female"]
df3=master_df2[,name$V3=="1yr_male"]
df4=master_df2[,name$V3=="5yr_male"]
df5=master_df2[,name$V3=="44yr_female"]
df6=master_df2[,name$V3=="6yr_male"]
df7=master_df2[,name$V3=="54yr_male"]
df8=master_df2[,name$V3=="22yr_male"]

library("ggplot2")
library("Rtsne")

#######计算各个donor的高变异位点
sds=apply(df1,1,sd)
a=order(sds,decreasing=T)
df1=df1[a[1:10],]

sds=apply(df2,1,sd)
a=order(sds,decreasing=T)
df2=df2[a[1:10],]

sds=apply(df3,1,sd)
a=order(sds,decreasing=T)
df3=df3[a[1:10],]

sds=apply(df4,1,sd)
a=order(sds,decreasing=T)
df4=df4[a[1:10],]

sds=apply(df5,1,sd)
a=order(sds,decreasing=T)
df5=df5[a[1:10],]

sds=apply(df6,1,sd)
a=order(sds,decreasing=T)
df6=df6[a[1:10],]

sds=apply(df7,1,sd)
a=order(sds,decreasing=T)
df7=df7[a[1:10],]

sds=apply(df8,1,sd)
a=order(sds,decreasing=T)
df8=df8[a[1:10],]

##########作图, 前两行定义不同的donor和标签
bb=b[name$V3=="22yr_male"]
bb=as.character(bb)
##这里开始做tsne，为了获得不同的tsne可以进行多次重复这一块
t8=Rtsne(t(df8),perplexity=15,check_duplicates =F)
t8y=as.data.frame(t8$Y)
t8y$label=bb
#library("ggplot2")
#pdf(file="22_tsne.pdf")
names(t8y)=c("TSNE 1","TSNE 2","Label")
ggplot(data=t8y,aes(x=`TSNE 1`,y=`TSNE 2`,fill=Label,color=Label))+geom_point()+theme_bw()+theme(panel.border=element_blank(),panel.grid.major=element_blank(),panel.grid.minor=element_blank(),axis.line=element_line(color="black"))
#####可以适当保存当前的tsne结果（ 5.00*5.80 inches ）
write.table(t8y,file="22.txt")
#获得对应的top10的高变异位点
row.names(df8) 



 bb=b[name$V3=="21yr_male"]
 bb=as.character(bb)
t1=Rtsne(t(df1),perplexity=15,check_duplicates =F)
t1y=as.data.frame(t1$Y)
t1y$label=bb
#library("ggplot2")
#pdf(file="21_tsne.pdf")
names(t1y)=c("TSNE 1","TSNE 2","Label")
ggplot(data=t1y,aes(x=`TSNE 1`,y=`TSNE 2`,fill=Label,color=Label))+geom_point()+theme_bw()+theme(panel.border=element_blank(),panel.grid.major=element_blank(),panel.grid.minor=element_blank(),axis.line=element_line(color="black"))
#####可以适当保存当前的tsne结果
write.table(t1y,file="21.txt")
#获得对应的top10的高变异位点
row.names(df1) 


bb=b[name$V3=="38yr_female"]
bb=as.character(bb)
t2=Rtsne(t(df2),perplexity=15,check_duplicates =F)
t2y=as.data.frame(t2$Y)
t2y$label=bb
#library("ggplot2")
#pdf(file="38_tsne.pdf")
names(t2y)=c("TSNE 1","TSNE 2","Label")
ggplot(data=t2y,aes(x=`TSNE 1`,y=`TSNE 2`,fill=Label,color=Label))+geom_point()+theme_bw()+theme(panel.border=element_blank(),panel.grid.major=element_blank(),panel.grid.minor=element_blank(),axis.line=element_line(color="black"))
#####可以适当保存当前的tsne结果
write.table(t2y,file="38.txt")
#获得对应的top10的高变异位点
row.names(df2) 


bb=b[name$V3=="1yr_male"]
bb=as.character(bb)
t3=Rtsne(t(df3),perplexity=15,check_duplicates =F)
t3y=as.data.frame(t3$Y)
t3y$label=bb
#library("ggplot2")
#pdf(file="1_tsne.pdf")
names(t3y)=c("TSNE 1","TSNE 2","Label")
ggplot(data=t3y,aes(x=`TSNE 1`,y=`TSNE 2`,fill=Label,color=Label))+geom_point()+theme_bw()+theme(panel.border=element_blank(),panel.grid.major=element_blank(),panel.grid.minor=element_blank(),axis.line=element_line(color="black"))
#####可以适当保存当前的tsne结果
write.table(t3y,file="1.txt")
#获得对应的top10的高变异位点
row.names(df3)


bb=b[name$V3=="5yr_male"]
bb=as.character(bb)
t4=Rtsne(t(df4),perplexity=15,check_duplicates =F)
t4y=as.data.frame(t4$Y)
t4y$label=bb
#library("ggplot2")
#pdf(file="5_tsne.pdf")
names(t4y)=c("TSNE 1","TSNE 2","Label")
ggplot(data=t4y,aes(x=`TSNE 1`,y=`TSNE 2`,fill=Label,color=Label))+geom_point()+theme_bw()+theme(panel.border=element_blank(),panel.grid.major=element_blank(),panel.grid.minor=element_blank(),axis.line=element_line(color="black"))
#####可以适当保存当前的tsne结果
write.table(t4y,file="5.txt")
#获得对应的top10的高变异位点
row.names(df4)


bb=b[name$V3=="44yr_female"]
bb=as.character(bb)
t5=Rtsne(t(df5),perplexity=15,check_duplicates =F)
t5y=as.data.frame(t5$Y)
t5y$label=bb
#library("ggplot2")
#pdf(file="44_tsne.pdf")
names(t5y)=c("TSNE 1","TSNE 2","Label")
ggplot(data=t5y,aes(x=`TSNE 1`,y=`TSNE 2`,fill=Label,color=Label))+geom_point()+theme_bw()+theme(panel.border=element_blank(),panel.grid.major=element_blank(),panel.grid.minor=element_blank(),axis.line=element_line(color="black"))
#####可以适当保存当前的tsne结果
write.table(t5y,file="44.txt")
#获得对应的top10的高变异位点
row.names(df5)


bb=b[name$V3=="6yr_male"]
bb=as.character(bb)
t6=Rtsne(t(df6),perplexity=15,check_duplicates =F)
t6y=as.data.frame(t6$Y)
t6y$label=bb
#library("ggplot2")
#pdf(file="6_tsne.pdf")
names(t6y)=c("TSNE 1","TSNE 2","Label")
ggplot(data=t6y,aes(x=`TSNE 1`,y=`TSNE 2`,fill=Label,color=Label))+geom_point()+theme_bw()+theme(panel.border=element_blank(),panel.grid.major=element_blank(),panel.grid.minor=element_blank(),axis.line=element_line(color="black"))
#####可以适当保存当前的tsne结果
write.table(t6y,file="6.txt")
#获得对应的top10的高变异位点
row.names(df6)


bb=b[name$V3=="54yr_male"]
bb=as.character(bb)
t7=Rtsne(t(df7),perplexity=15,check_duplicates =F)
t7y=as.data.frame(t7$Y)
t7y$label=bb
#library("ggplot2")
#pdf(file="54_tsne.pdf")
names(t7y)=c("TSNE 1","TSNE 2","Label")
ggplot(data=t7y,aes(x=`TSNE 1`,y=`TSNE 2`,fill=Label,color=Label))+geom_point()+theme_bw()+theme(panel.border=element_blank(),panel.grid.major=element_blank(),panel.grid.minor=element_blank(),axis.line=element_line(color="black"))
#####可以适当保存当前的tsne结果
write.table(t7y,file="54.txt")
#获得对应的top10的高变异位点
row.names(df7)


################
######定义搜索marker site的函数
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
thread=2

#####重新生成每个donor的数据
df1=master_df2[,name$V3=="21yr_male"]
df2=master_df2[,name$V3=="38yr_female"]
df3=master_df2[,name$V3=="1yr_male"]
df4=master_df2[,name$V3=="5yr_male"]
df5=master_df2[,name$V3=="44yr_female"]
df6=master_df2[,name$V3=="6yr_male"]
df7=master_df2[,name$V3=="54yr_male"]
df8=master_df2[,name$V3=="22yr_male"]

########################################################
data=df8
bb=b[name$V3=="22yr_male"]
bb=as.character(bb)
cl <- makeCluster(getOption("cl.cores", thread))
name2=row.names(data)
all.markers=list()
gmarkers=c()
ncluster=as.numeric(bb)
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
####计算获得前10个marker site
data=data[a[1:10],]
bb=as.character(bb)
######## 同样tsne部分
t8=Rtsne(t(data),perplexity=15,check_duplicates =F)
t8y=as.data.frame(t8$Y)
t8y$label=bb
#library("ggplot2")
#pdf(file="22_tsne.pdf")
names(t8y)=c("TSNE 1","TSNE 2","Label")
ggplot(data=t8y,aes(x=`TSNE 1`,y=`TSNE 2`,fill=Label,color=Label))+geom_point()+theme_bw()+theme(panel.border=element_blank(),panel.grid.major=element_blank(),panel.grid.minor=element_blank(),axis.line=element_line(color="black"))
#####同样适当保存当前的tsne结果
write.table(t8y,file="22.txt")
#获得对应的top10的marker site
row.names(data) 


data=df1
bb=b[name$V3=="21yr_male"]
bb=as.character(bb)
cl <- makeCluster(getOption("cl.cores", thread))
name2=row.names(data)
all.markers=list()
gmarkers=c()
ncluster=as.numeric(bb)
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
bb=as.character(bb)
t8=Rtsne(t(data),perplexity=15,check_duplicates =F)
t8y=as.data.frame(t8$Y)
t8y$label=bb
#library("ggplot2")
#pdf(file="22_tsne.pdf")
names(t8y)=c("TSNE 1","TSNE 2","Label")
ggplot(data=t8y,aes(x=`TSNE 1`,y=`TSNE 2`,fill=Label,color=Label))+geom_point()+theme_bw()+theme(panel.border=element_blank(),panel.grid.major=element_blank(),panel.grid.minor=element_blank(),axis.line=element_line(color="black"))
#####同样适当保存当前的tsne结果
write.table(t8y,file="21.txt")
#获得对应的top10的marker site
row.names(data) 

data=df2
bb=b[name$V3=="38yr_female"]
bb=as.character(bb)
cl <- makeCluster(getOption("cl.cores", thread))
name2=row.names(data)
all.markers=list()
gmarkers=c()
ncluster=as.numeric(bb)
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
bb=as.character(bb)
t8=Rtsne(t(data),perplexity=15,check_duplicates =F)
t8y=as.data.frame(t8$Y)
t8y$label=bb
names(t8y)=c("TSNE 1","TSNE 2","Label")
ggplot(data=t8y,aes(x=`TSNE 1`,y=`TSNE 2`,fill=Label,color=Label))+geom_point()+theme_bw()+theme(panel.border=element_blank(),panel.grid.major=element_blank(),panel.grid.minor=element_blank(),axis.line=element_line(color="black"))
#####同样适当保存当前的tsne结果
write.table(t8y,file="38.txt")
#获得对应的top10的marker site
row.names(data) 

data=df3
bb=b[name$V3=="1yr_male"]
bb=as.character(bb)
cl <- makeCluster(getOption("cl.cores", thread))
name2=row.names(data)
all.markers=list()
gmarkers=c()
ncluster=as.numeric(bb)
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
bb=as.character(bb)
t8=Rtsne(t(data),perplexity=15,check_duplicates =F)
t8y=as.data.frame(t8$Y)
t8y$label=bb
names(t8y)=c("TSNE 1","TSNE 2","Label")
ggplot(data=t8y,aes(x=`TSNE 1`,y=`TSNE 2`,fill=Label,color=Label))+geom_point()+theme_bw()+theme(panel.border=element_blank(),panel.grid.major=element_blank(),panel.grid.minor=element_blank(),axis.line=element_line(color="black"))
#####同样适当保存当前的tsne结果
write.table(t8y,file="1.txt")
#获得对应的top10的marker site
row.names(data) 

data=df4
bb=b[name$V3=="5yr_male"]
bb=as.character(bb)
cl <- makeCluster(getOption("cl.cores", thread))
name2=row.names(data)
all.markers=list()
gmarkers=c()
ncluster=as.numeric(bb)
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
bb=as.character(bb)
t8=Rtsne(t(data),perplexity=15,check_duplicates =F)
t8y=as.data.frame(t8$Y)
t8y$label=bb
names(t8y)=c("TSNE 1","TSNE 2","Label")
ggplot(data=t8y,aes(x=`TSNE 1`,y=`TSNE 2`,fill=Label,color=Label))+geom_point()+theme_bw()+theme(panel.border=element_blank(),panel.grid.major=element_blank(),panel.grid.minor=element_blank(),axis.line=element_line(color="black"))
#####同样适当保存当前的tsne结果
write.table(t8y,file="5.txt")
#获得对应的top10的marker site
row.names(data) 


data=df5
bb=b[name$V3=="44yr_female"]
bb=as.character(bb)
cl <- makeCluster(getOption("cl.cores", thread))
name2=row.names(data)
all.markers=list()
gmarkers=c()
ncluster=as.numeric(bb)
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
bb=as.character(bb)
t8=Rtsne(t(data),perplexity=15,check_duplicates =F)
t8y=as.data.frame(t8$Y)
t8y$label=bb
names(t8y)=c("TSNE 1","TSNE 2","Label")
ggplot(data=t8y,aes(x=`TSNE 1`,y=`TSNE 2`,fill=Label,color=Label))+geom_point()+theme_bw()+theme(panel.border=element_blank(),panel.grid.major=element_blank(),panel.grid.minor=element_blank(),axis.line=element_line(color="black"))
#####同样适当保存当前的tsne结果
write.table(t8y,file="44.txt")
#获得对应的top10的marker site
row.names(data) 


data=df6
bb=b[name$V3=="6yr_male"]
bb=as.character(bb)
cl <- makeCluster(getOption("cl.cores", thread))
name2=row.names(data)
all.markers=list()
gmarkers=c()
ncluster=as.numeric(bb)
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
bb=as.character(bb)
t8=Rtsne(t(data),perplexity=15,check_duplicates =F)
t8y=as.data.frame(t8$Y)
t8y$label=bb
names(t8y)=c("TSNE 1","TSNE 2","Label")
ggplot(data=t8y,aes(x=`TSNE 1`,y=`TSNE 2`,fill=Label,color=Label))+geom_point()+theme_bw()+theme(panel.border=element_blank(),panel.grid.major=element_blank(),panel.grid.minor=element_blank(),axis.line=element_line(color="black"))
#####同样适当保存当前的tsne结果
write.table(t8y,file="6.txt")
#获得对应的top10的marker site
row.names(data) 


data=df7
bb=b[name$V3=="54yr_male"]
bb=as.character(bb)
cl <- makeCluster(getOption("cl.cores", thread))
name2=row.names(data)
all.markers=list()
gmarkers=c()
ncluster=as.numeric(bb)
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
bb=as.character(bb)
t8=Rtsne(t(data),perplexity=15,check_duplicates =F)
t8y=as.data.frame(t8$Y)
t8y$label=bb
names(t8y)=c("TSNE 1","TSNE 2","Label")
ggplot(data=t8y,aes(x=`TSNE 1`,y=`TSNE 2`,fill=Label,color=Label))+geom_point()+theme_bw()+theme(panel.border=element_blank(),panel.grid.major=element_blank(),panel.grid.minor=element_blank(),axis.line=element_line(color="black"))
#####同样适当保存当前的tsne结果
write.table(t8y,file="54.txt")
#获得对应的top10的marker site
row.names(data) 








