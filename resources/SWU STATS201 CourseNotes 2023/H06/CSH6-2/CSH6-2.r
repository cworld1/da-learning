survey.df = rr()

geomean = function(x){
  n = length(x)
  prod(x^(1/n))
}

hair.df = with(survey.df, data.frame(hair = hair, sex = sex))
plot(log(hair)~sex, data = hair.df)
split.data = with(hair.df, split(hair,sex))
means  = sapply(split.data, geomean)
ratio.means = means[1] / means[2]

fGeo = function(d, ind){
  split.data = with(d[ind,], split(hair,sex))
  means  = sapply(split.data, geomean)
  return(means[1] / means[2])
}

## bootstrapped confidence interval for ratio of geometric means 
## of amount of money spent on hair
library(boot)
b = boot(data = hair.df, statistic = fGeo, R = 1000, stype = "i", strata = as.numeric(hair.df$sex))
boot.ci(b)

## approximation using log transformation
exp(t.test(log(hair)~sex, data = hair.df)$conf.int)


