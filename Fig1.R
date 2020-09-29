library("VennDiagram")

tabli_venn<-read.table("Malawi_USA_Ven.txt",header=T) #Here we change the name of the file we want to plot as a VennDiagram

Vec1<-na.omit(as.vector(tabli_venn[,1])) #The number of "Vec" values depend on the number of columns (samples) we want to evaluate in this Venn diagram
Vec2<-na.omit(as.vector(tabli_venn[,2]))
Vec3<-na.omit(as.vector(tabli_venn[,3]))

venn.plot <- venn.diagram(list(Malawi = Vec1, USA = Vec2, Venezuela = Vec3),"Malawi_USA_Ven.svg",height = 10,width = 10,resolution = 30,imagetype = "svg")
venn.plot <- venn.diagram(list(Malawi = Vec1, USA = Vec2, Venezuela = Vec3),"Malawi_USA_Ven.png",imagetype = "png")
