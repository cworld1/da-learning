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
  signifLine = grep("^Signif.*$", Lines)
  anovaSummaryBlock = list(start = grep("^Residual standard.*$", Lines),
                           end = grep("^F-statistic.*$", Lines))
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