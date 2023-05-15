lowbwt.df = read.csv("../Data/lowbwt.csv")
library(plyr)
lowbwt.df$low = revalue(as.factor(lowbwt.df$low), c("0" = "Normal", "1" = "Low"))
lowbwt.df$smoke = revalue(as.factor(lowbwt.df$smoke), c("0" = "Non-Smoker", "1" = "Smoker"))
lowbwt.df$race = revalue(as.factor(lowbwt.df$race), c("1" = "Caucasian", "2" = "African American", "3" = "Other"))
lowbwt.df = lowbwt.df[,c(2,5,6)]
head(lowbwt.df, 5)

#
smoke.low.tbl = with(lowbwt.df, table(smoke, low))
smoke.low.tbl

race.low.tbl = with(lowbwt.df, table(race, low))
race.low.tbl

#
library(s20x)
rowdistr(smoke.low.tbl)
chisq.test(smoke.low.tbl)
chisq.test(smoke.low.tbl,correct=FALSE)
fisher.test(smoke.low.tbl)
library(epitools) #For odds ratio function
oddsratio(smoke.low.tbl,method="wald")

#glm
df=as.data.frame(smoke.low.tbl)
g=glm(Freq~smoke*low,family=poisson,data=df)
summary(g)

#glm with confounders
smoke.low.race.tbl = with(lowbwt.df, 
                          table(smoke, low, race))
chisq.test(smoke.low.race.tbl[,,"Caucasian"],correct=FALSE)
chisq.test(smoke.low.race.tbl[,,"African American"],correct=FALSE)
chisq.test(smoke.low.race.tbl[,,"Other"],correct=FALSE)

df=as.data.frame(smoke.low.race.tbl)
g2=glm(Freq~race*smoke+smoke*low+low*race,family=poisson,data=df)
summary(g2)
