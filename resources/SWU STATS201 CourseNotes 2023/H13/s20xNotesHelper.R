slimSummary = function(lm.obj, 
                       showCall = FALSE, 
                       showResiduals = FALSE,
                       showSignif = FALSE, 
                       showAOVsummary = TRUE,
                       ...){
  
  Lines = capture.output(summary(lm.obj, ...))
  
  callBlock = grep("^(Call|lm).*$", Lines)
  resBlock = grep("^Residuals.*$", Lines) + 0:2
  coefTable = list(start = grep("^Coefficients:.*$", Lines),
                   end = grep("^---$", Lines))
  
  ## special case for constant mean model, e.g. y ~ 1
  if(length(coefTable$end) == 0){
    blanks = which(nchar(Lines) == 0)
    coefTable$end = (blanks[blanks > coefTable$start])[1] ## first blank line after start
  }
  
  signifLine = grep("^Signif.*$", Lines)
  anovaSummaryBlock = list(start = grep("^Residual standard.*$", Lines),
                           end = grep("^F-statistic.*$", Lines))
  
  ## special case for constant mean model, e.g. y ~ 1
  if(length(anovaSummaryBlock$end) == 0){
    blanks = which(nchar(Lines) == 0)
    anovaSummaryBlock$end = (blanks[blanks > anovaSummaryBlock$start])[1] ## first blank line after start
  }
  
  if(showCall){
    cat(paste0(Lines[callBlock], collapse = "\n"))
    cat("\n")
  }
    
  if(showResiduals){
    cat(paste0(Lines[resBlock], "\n"))
    cat("\n")
  }
  
  cat(paste0(Lines[coefTable$start:coefTable$end], collapse = "\n"))
  cat("\n")

  if(showSignif){
    cat(paste0(Lines[signifLine], "\n"))
    cat("\n")
  }
  
  if(showAOVsummary){
    cat(paste0(Lines[anovaSummaryBlock$start:anovaSummaryBlock$end], 
               collapse = "\n"))
  }
}