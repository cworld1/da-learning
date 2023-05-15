options(digits=10)
ap.df=read.table("../Data/AttendPass.txt",header=T)

ap.tbl=with(ap.df,table(Attend,Pass))
ap.tbl
as.data.frame(ap.tbl)

#Using chi-squared test and odds-ratio
ap.chisq=chisq.test(ap.tbl,correct=FALSE)
ap.chisq$stat
#26.01593157 
ap.chisq$expected
fisher.test(ap.tbl)

library(epitools) #For odds ratio function
oddsratio(ap.tbl,rev="columns",method="wald")

#cf glm
ap.freqs.df=as.data.frame(ap.tbl)
ap.glm=glm(Freq~Attend*Pass,family=poisson,data=ap.freqs.df)
summary(ap.glm)
predict(ap.glm)
exp(predict(ap.glm))
as.table(matrix( exp(predict(ap.glm)),nrow=2))

#As test of proportions
ap.prop=prop.test(ap.tbl,correct=FALSE)
#Using 10x method with additive se's
10x.ptest=function(tbl) {}
  totals=apply(tbl,1,sum)
  phats=ap.tbl[,1]/totals
  se=sqrt(sum(phats*(1-phats)/totals))
  Z=(phats[1]-phats[2])/se
  return(Z) }

Z=10x.ptest
X=Z^2
X
#26.02039223 

z.prop = function(x1,x2,n1,n2){
  numerator = (x1/n1) - (x2/n2)
  p.common = (x1+x2) / (n1+n2)
  denominator = sqrt(p.common * (1-p.common) * (1/n1 + 1/n2))
  z.prop.ris = numerator / denominator
  return(z.prop.ris)
}
Z=z.prop(ap.tbl[1,1],ap.tbl[2,1],sum(ap.tbl[1,]),sum(ap.tbl[2,]))
Z
#-5.100581493
#cf
sqrt(ap.chisq$stat)
#5.100581493

