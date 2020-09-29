library(Tax4Fun)

file <- "otu_table_Tax4.txt" #input OTU table
QiimeData <- importQIIMEData(file)
print(QiimeData)
# SO is my dir for SO answer work
folderReferenceData <- "D:/SILVA123/" #PATH to SILVA
Tax4FunOutput <- Tax4Fun(QiimeData, folderReferenceData, fctProfiling 
                         =TRUE, refProfile = "UProC", shortReadMode = TRUE, normCopyNo = TRUE)
print(Tax4FunOutput)
Tax4FunProfile <- Tax4FunOutput$Tax4FunProfile
Tax4FunProfile <- data.frame(t(Tax4FunOutput$Tax4FunProfile))
View(Tax4FunProfile)
#save to excel 
write.table(Tax4FunProfile,"Tax4FunProfile_Export.csv",sep="\t")