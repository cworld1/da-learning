#Rename columns in a dataframe
Rename=function(df,old.name,new.name) {
  names(df)[match(old.name,names(df))]=new.name
  return(df) }

#Impute, by replacing NAs with average (of vector)
Impute=function(y) { ifelse(!is.na(y),y,mean(y,na.rm=T)) }

Centre=function(y) {y-mean(y)}

Underline=function(y) paste(rep("=",nchar(y)),collapse="")

#Mean on non-NA numerics
meanN=function(y) {mean(y,na.rm=T)}

#Sum over hauls
SumDf=function(df) { 
  combnwide=aggregate(df[,2],list(df[,1]),sum)$x
  combnfine=aggregate(df[,3],list(df[,1]),sum)$x
  TL=sort(unique(df[,1]))
  y=combnwide
  n=combnwide+combnfine
  df=data.frame(TL,combnwide,combnfine,y,n)
  colnames(df)=c("TL","test","cover","y","n")
  return(df) }

#Stack two dataframes, and add variable grp as indicator 
StackDf=function(df1,df2) {
  df1=transform(df1,grp=1)
  df2=transform(df2,grp=2)
  df=data.frame(rbind(df1,df2))
  df=transform(df,grp=as.factor(grp))
  return(df) }

#Stack two or more dataframes, and add variable grp as indicator 
StackDfList=function(dflist,grplist=NULL) {
  n=length(dflist)
  if(is.null(grplist)) grplist=as.list(1:n)
  for(i in 1:n) dflist[[i]]=transform(dflist[[i]],grp=grplist[[i]])
  df=dflist[[1]]
  for(i in 2:n) df=data.frame(rbind(df,dflist[[i]]))
  df=transform(df,grp=as.factor(grp))
  return(df) }

#For tranforming from individual fish length*gear observations
#into a length*gear table
FreqTable=function(df,len,gear,rnd=NULL,wgt=NULL) {
  if(!is.null(rnd)) df[,len]=round(df[,len],rnd)
  if(is.null(wgt)) Table=table(df[,len],df[,gear])
    else Table=table(rep(df[,len],df[,wgt]),rep(df[,gear],df[,wgt]))
  Table=cbind(as.numeric(rownames(Table)),Table)
  rownames(Table)=NULL
  colnames(Table)[1]=len 
  return(Table) }

#R-arrange if the length-freqs in paired gears are in different dfs
#for each gear. Assumes variables Length and HaulID.
Combine=function(df1,df2,varnames=NULL) {
  if(is.null(varnames)) varnames=c("nwide","nfine")
  Wk=merge(df1,df2,by=c("HaulID","Length"),all=T)
  Wk=with(Wk,Wk[order(HaulID,Length),])
  Wk=Wk[,c("Length","Number.x","Number.y","HaulID")]
  Wk=rename(Wk,c("Number.x","Number.y"),varnames)
  Wk=data.matrix(Wk)
  Wk[is.na(Wk)]=0 #Replace NA's with zeros
  return(CatchDat=Wk) }      
  

