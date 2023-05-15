require(reshape)
source("UsefulDfFunctions.R")
LTH.df=read.table("../Data/LTH.txt",header=TRUE)
LTH.df=transform(LTH.df,Juv=MaxSna-LegSna,Legal=LegSna)
CROP.df=subset(LTH.df,subset=c(Reserve=="CROP" & Date=="4May99"),
               select=c("Status","Station","Depth","Legal","Juv"))
CROP.df[1:10,]
Sna.df=melt(CROP.df,id=c("Status","Station","Depth"))
Sna.df=Rename(Sna.df,c("variable","value"),c("Size","y"))
Sna.df=subset(Sna.df,select=-c(Station,Depth))

#Unbalance data (so that analysis of means would not make sense)? No.
#Sna2.df=Sna.df[-c(1,2,5:7,49,50,53:55),] #Remove 10 NR
#RandSna.df=Sna2.df[sample(1:nrow(Sna2.df)),]
#summary(RandSna.df)
#write.table(RandSna.df,"CROPsna.txt",sep=" ",row.names=FALSE)

CROP.df=read.table("CROPsna.txt",header=TRUE)
#interactionPlots(y~Status+Size,data=CROP.df)

CROP.gfit=glm(y~Status*Size,family=poisson,data=CROP.df)
summary(CROP.gfit)

CROP.qgfit=glm(y~Status*Size,family=quasipoisson,data=CROP.df)
summary(CROP.qgfit)
plot(Sna.qgfit,which=1)

exp(confint.default(CROP.qgfit))
