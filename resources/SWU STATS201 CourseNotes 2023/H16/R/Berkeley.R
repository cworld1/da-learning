Berk.df=read.table("../Data/BerkeleyEnrolments.txt",header=T,skip=1)
Berk.tbl=xtabs(Freq~Gender+Outcome,data=Berk.df)
chisq.test(Berk.tbl,correct=FALSE)

library(epitools)
oddsratio(Berk.tbl,method="wald")$measure

g=glm(Freq~Gender*Outcome,family=poisson,data=Berk.df)
summary(g)

g3=glm(Freq~Dept*Gender+Dept*Outcome+Gender*Outcome,family=poisson,data=Berk.df)
plot(g3,which=1)
summary(g3)
1-pchisq(20.2,5)


g3quasi=glm(Freq~Dept*Gender+Dept*Outcome+Gender*Outcome,
            family=quasipoisson,data=Berk.df)
summary(g3quasi)
g3.anova=anova(g3quasi,test="F")
g3.anova[,names(g3.anova)]
confint.default(g3quasi)[19,]
  

g4=glm(Freq~Dept*Gender+Dept*Outcome+Gender+Outcome,family=poisson,data=Berk.df)
summary(g4)

anova(g3,g4)