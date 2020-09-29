library("ggplot2")

tabli<-read.table("results_rectum_illeum.txt",header=T,row.names=1,sep="\t") #input table reaction and prevalence

tabli_rectum<-as.data.frame(tabli$CD_Rectum-tabli$Not_IBD_Rectum)
rownames(tabli_rectum)<-rownames(tabli)
colnames(tabli_rectum)[1]<-"Diff"
tabli_rectum$Reacciones<-rownames(tabli_rectum)
#tabli_rectum <- tabli_rectum[order(tabli_rectum$Diff),] 

tabli_rectum$Reacciones <- factor(tabli_rectum$Reacciones, levels = tabli_rectum$Reacciones[order(-tabli_rectum$Diff)])

ggplot(tabli_rectum,aes(Reacciones,Diff)) + geom_point() + labs(title="Rectum (CD-NotIBD)")



tabli_illeum<-as.data.frame(tabli$CD_Illeum-tabli$Not_IBD_Illeum)
rownames(tabli_illeum)<-rownames(tabli)
colnames(tabli_illeum)[1]<-"Diff"
tabli_illeum$Reacciones<-rownames(tabli_illeum)
#tabli_illeum <- tabli_illeum[order(tabli_illeum$Diff),] 

tabli_illeum$Reacciones <- factor(tabli_illeum$Reacciones, levels = tabli_illeum$Reacciones[order(-tabli_illeum$Diff)])

ggplot(tabli_illeum,aes(Reacciones,Diff)) + geom_point() + labs(title="Illeum (CD-NotIBD)")