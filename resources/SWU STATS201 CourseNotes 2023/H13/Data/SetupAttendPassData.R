df=read.table("Pass.Attend.OldFormat.txt",header=T)
n=nrow(df)
Df=df[sample(1:n,replace=F),]
rownames(Df)=NULL
Df=transform(Df,Subject=1:n)
Df=Df[,c(3,1,2)]
head(Df,10)
write.table(Df,"AttendPass.txt",quote=FALSE,row.names=FALSE)
