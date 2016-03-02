K<- read.table("K.R.dat",header=T)
attach(K)
fm <- lm(goes ~ station)
fm0 <- lm(goes ~ 0 + station)
plot(station,goes,ylim=range(0,1.2),xlim=range(0,1.2),type="p",pch=".",col="gray")
abline(fm0,col="black",lty=1,lwd=1)
abline(fm,col="black",lty=3,lwd=2)
#summary(fm) for info
leg<-c("y=1.09x      R^2=0.98",
       "y=0.65x+0.37 R^2=0.74")
legend(0,1.2,leg,lty=c(1,3),lwd=c(1,2))
