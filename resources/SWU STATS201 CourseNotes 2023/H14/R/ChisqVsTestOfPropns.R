##THE CHISQ AND TEST OF PROPNS (COMBINED PHAT) ARE EQUIVALENT
##STATS10X USED SUMMED VAR FORM, WHICH IS DIFFERENT
#Combined phat form
z.prop = function(x1,x2,n1,n2){
  numerator = (x1/n1) - (x2/n2)
  p.common = (x1+x2) / (n1+n2)
  denominator = sqrt(p.common * (1-p.common) * (1/n1 + 1/n2))
  z.prop.ris = numerator / denominator
  return(z.prop.ris)
}

options(digits=10)
Z=z.prop(30, 65, 74, 103)
Z
#-2.969695214

pt=prop.test(x = c(30, 65), n = c(74, 103), correct = FALSE)
pt$statistic
#8.819089663 

X=chisq.test(matrix(c(30, 65, 44, 38),byrow=FALSE,nrow=2),correct=FALSE)$statistic
X
#8.819089663

#Cf with Z stat
sqrt(pt$statistic)
#2.969695214

#####################
#With smaller counts#
Z=z.prop(3, 6, 7, 10)
Z
#-0.6969320524

pt=prop.test(x = c(3, 6), n = c(7, 10), correct = FALSE)
pt$statistic
#0.4857142857

X=chisq.test(matrix(c(3, 6, 4, 4),byrow=FALSE,nrow=2),correct=FALSE)$statistic
X
#0.4857142857

#Cf with Z stat
sqrt(pt$statistic)
#0.6969320524