library("ggplot2")
library("reshape2")

tabli<-read.table("Reaction_threeshold.txt",header=T) #File where we have the info about the number of reactions by threeshold value

tabli_m<-melt(tabli)

ggplot(tabli_m,aes(Cores,value,col=variable)) + 
  geom_point() + 
  scale_y_continuous(breaks = seq(0,3700,100)) +
  theme(legend.text=element_text(size=0.5),axis.text.x = element_text(angle = 90, hjust = 1, vjust = 0.5))
