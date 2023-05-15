m=0.2
s=1-m
max.age=50
Age=1:max.age
N=rpois(max.age,100*s^(Age))
N[38]=1

write.table(data.frame(Age,N),"FishCountsByAge.txt",quote=FALSE,row.names=FALSE)

