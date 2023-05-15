library(s20x)
Rpackage.df=read.csv("Rpackages.csv",header=T)
Year0=0
CRAN.df=within(Rpackage.df,{Year=Year-Year0})

#Exploratory
par(mfrow=c(1,1))
plot(Number~Year,data = CRAN.df,
      ylab = "Number of R packages",xlab="Years after 2004",las=1)

CRAN.gfit= glm(Number~Year,family=quasipoisson,data=CRAN.df)
summary(CRAN.gfit)$coef
exp(confint(CRAN.gfit))
Pred.df=data.frame(Year=2015-Year0)
pred=predict(CRAN.gfit,Pred.df,se.fit=TRUE)
#Calculate estimate and 95% CI
exp(pred$fit)
exp(pred$fit+c(-1,1)*1.96*pred$se.fit)

#Test predictCount function
exp(predictCount(CRAN.gfit,Pred.df))

#Overlay fitted curve on plot
YearSeq=seq(1,10,0.1)
PredYr=data.frame(Year=YearSeq)
PredCRAN=predict(CRAN.gfit,PredYr,type="response")
lines(YearSeq,PredCRAN,type="l")

#cf linear model on subset of logged data
CRAN2.df=CRAN.df[4:10,]
CRAN2.fit=lm(log(Number)~Year,data=CRAN2.df)
exp(predict(CRAN2.fit,Pred.df,interval="confidence"))

