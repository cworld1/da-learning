#See http://scedc.caltech.edu/Module/s2act08.html
#Earthquake numbers in Sthn California and WA, 1987 to 1996
Quakes.df=read.table("../Data/EarthquakeMagnitudes.txt",header=TRUE)
Quakes.df

plot(Freq~Magnitude,data=Quakes.df,pch=substr(Locn,1,1))
Quake.gfit=glm(Freq~Locn*Magnitude,family=poisson,data=Quakes.df)
plot(Quake.gfit,which=1)
summary(Quake.gfit)
confint.default(Quake.gfit)
exp(confint.default(Quake.gfit)[3:4,])

Quakes2.df=within(Quakes.df,{Locn2=factor(Locn,levels=c("WA","SC"))})
Quake2.gfit=glm(Freq~Locn2*Magnitude,family=poisson,data=Quakes2.df)
exp(confint.default(Quake2.gfit)[3:4,])
