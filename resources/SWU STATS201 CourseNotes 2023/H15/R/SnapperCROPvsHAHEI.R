Snap.df=read.table("../Data/SnapperCROPvsHAHEI.txt",header=TRUE)
Snap.df

interactionPlots(Freq~Locn*Reserve,data=Snap.df,col.width=0)

Snap.glm=glm(Freq~Locn*Reserve,family=poisson,data=Snap.df)
plot(Snap.glm,which=1)
summary(Snap.glm)

Snap2.glm=glm(Freq~Locn+Reserve,family=poisson,data=Snap.df)
summary(Snap2.glm)

exp(confint.default(Snap2.glm))

#We conclude that the count of snapper is between 3 and 19 times higher in marine
#reserves than in the area immediately outside of the reserve.
#Moreover, the HAHEI marine reserve has lower snapper counts than the CROP reserve
# - it is between 19% and 59% that of CROP
