#Data from column 5 of Table 1 of Dalal et al. 1991
Shuttle.df=read.table("../Data/ChallengerShuttle.txt",header=T) #23 obs
Shuttle.df=transform(Shuttle.df,n=6,Propn=Failure/6)
ShuttleNonZero.df=subset(Shuttle.df,subset=c(Failure>0)) #7 obs
n=nrow(Shuttle.df) #23 or 7

attach(Shuttle.df)

pdf("../Figures/AllOringsLM.pdf",height=3,width=5)
par(mar=c(4,4,1,1))
plot(Temp,Propn,xlim=c(30,85),ylim=c(-0.1,1),las=1,xlab="Temp (Fahrenhiet)")
abline(h=0,lty=3)

lm.fit=lm(Propn~Temp,data=Shuttle.df)
summary(lm.fit)
abline(coef(lm.fit))
graphics.off()
detach(Shuttle.df)

attach(ShuttleNonZero.df)
pdf("../Figures/NonZeroOringsLM.pdf",height=3,width=5)
par(mar=c(4,4,1,1))
plot(Temp,Propn,xlim=c(30,85),ylim=c(-0.1,1),las=1,xlab="Temp (Fahrenhiet)")
abline(h=0,lty=3)

lm.fit=lm(Propn~Temp,data=ShuttleNonZero.df)
summary(lm.fit)
abline(coef(lm.fit))
graphics.off()
detach(ShuttleNonZero.df)


#As binomial data
attach(Shuttle.df)


Space.gfit=glm(Propn~Temp,weight=n,family=binomial,data=Shuttle.df)
summary(Space.gfit)
g.coefs=coef(Space.gfit)
temp=28:82
eta=g.coefs[1]+temp*g.coefs[2]
pred=exp(eta)/(1+exp(eta))

#Prediction at 31F
Pred31=data.frame(Temp=31)
predict(Space.gfit,Pred31,type="response")
predictCount(Space.gfit,Pred31)
6*predictCount(Space.gfit,Pred31)

pdf("../Figures/AllOringsGLM.pdf",height=3,width=5)
par(mar=c(4,4,1,1))
plot(Temp,Propn,xlim=c(30,85),ylim=c(-0.1,1),las=1,xlab="Temp (Fahrenhiet)")
abline(h=0,lty=3)
points(temp,pred,type="l",lty=2)
graphics.off()

detach(Shuttle.df)


#As count data
#glm.fit=glm(Failure~Temp,family=poisson,data=Shuttle.df)
#summary(glm.fit)
#g.coefs=coef(glm.fit)
#temp=28:82
#eta=g.coefs[1]+temp*g.coefs[2]
#points(temp,exp(eta),type="l",lty=2)