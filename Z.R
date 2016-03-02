I<-read.table("Z.image",header=TRUE)
S<-read.table("Z.stations",header=TRUE)
options(digits=1) 
require(Hmisc) 

out <- histbackback(I$elevation/100,S$elevation/100, probability=TRUE,brks=seq(-1,43), xlab=c('CA','CIMIS'),ylab='Elevation [100 m]')




