fog<- read.table("winter_fog_Rs.R.dat",header=T)
attach(fog)
fm <- lm(goes ~ station)
fm0 <- lm(goes ~ 0 + station)
plot(station,goes,ylim=range(0,20),xlim=range(0,20),type="p",col="gray")
abline(fm0,col="black",lty=1,lwd=1)
abline(fm,col="black",lty=3,lwd=2)
#summary(fm) for info
leg<-c("y=1.12x      R^2=0.95",
       "y=0.65x+4.67 R^2=0.90")
legend(0,20,leg,lty=c(1,3),lwd=c(1,2))
