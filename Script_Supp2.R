library("ggplot2")

tabli<-read.table("results.txt",header=T) #Prevalence input table

ggplot(tabli,aes(Type,Preval_Metagenome,col=Core_global))+
  geom_jitter() +
  theme_bw() + 
  theme(legend.position="none",panel.border = element_blank(), panel.grid.major = element_blank(), panel.grid.minor = element_blank(), axis.line = element_line(colour = "black"))
