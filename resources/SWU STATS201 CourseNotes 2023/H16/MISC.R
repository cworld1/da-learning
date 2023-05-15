#Motivation for Chap 16-19

xx=data.frame(Attend=c("Y","N","Y","N"),Pass=c("Fail","Fail","Pass","Pass"),freq=c(17,27,83,19))
xx

xx.fit=glm(freq~Attend*Pass,family=poisson,data=xx)
summary(xx.fit)

xx2=data.frame(Attend=c("Y","N"),Fail=c(17,27),Pass=c(83,19))
xx2

xx2.fit=glm(cbind(Fail,Pass)~Attend,family=binomial,data=xx2)
summary(xx2.fit)


#Same effect of attend:pass is estimated.
chisq.test(xx2[,-1])
chisq.test(xx2[,-1],correct=F)