## This code chunk makes sure any packages we use are installed

checkInstall = function(Packages){
  for(pkg in Packages){
      if(!(pkg %in% installed.packages())){
          suppressMessages(
              install.packages(pkg, repos = "https://cran.stat.auckland.ac.nz/")
          )
      }
  }
}

#remotes::install_github("jmcurran/s20xHelpR")
#install.packages("~/GitHub/s20x/s20x_3.1-24.tar.gz", repos = NULL, type = "source")
checkInstall(c('bootstrap', 'dafs', 'epitools', 's20x', 'stringr', 'knitr', 's20xHelpR'))

library(stringr)
library(s20xHelpR)
