library(s20x)
#s20x.df=read.table("../Data/Stats20x.txt",header=TRUE)
#DF=within(s20x.df,
#   {StudyHrs=(Pass=="No")*5*rchisq(146,10)+(Pass!="No")*5*rchisq(146,20)} )
#DF=within(DF,{StudyHrs=10*round(StudyHrs/10)}) #To nearest 10 hrs
#write.table(DF[,c("Pass","StudyHrs")],"STATS20xHrs.txt",row=FALSE)


DF=read.table("STATS20xHrs.txt",header=TRUE)
pairs20x(DF[,c("Pass","StudyHrs")])

pass.gfit=glm(Pass~StudyHrs,family=binomial,data=DF)
plot(pass.gfit,which=1)
summary(pass.gfit)


