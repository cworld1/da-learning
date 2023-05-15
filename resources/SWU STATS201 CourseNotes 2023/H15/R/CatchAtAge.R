Df=read.table("../Data/FishCountsByAge.txt",header=T)
Df=Df[1:30,]
attach(Df)

plot(Age,N,las=1,xlim=c(0,30),ylim=c(-20,80))
abline(h=0,lty=3)

lm.fit=lm(N~Age,data=Df)
summary(lm.fit)
abline(coef(lm.fit))

#As count data
glm.fit=glm(N~Age,family=poisson,data=Df)
summary(glm.fit)
g.coefs=coef(glm.fit)
ages=1:40
eta=g.coefs[1]+ages*g.coefs[2]
points(ages,exp(eta),type="l",lty=2)

detach(Df)