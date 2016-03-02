Rnll<- read.table("Rnl.R.dat.summary",header=TRUE)
attach(Rnll)
Rnl<- read.table("Rnl.R.dat",header=T)
attach(Rnl)
fm <- lm(goes ~ station)
fme<- coef(fm)
fm0 <- lm(goes ~ 0 + station)
fm0e<- coef(fm0)
plot(Station,GOES,ylim=range(-3,10),xlim=range(-3,10),type="p",pch=".",col="gray")
abline(fm0,col="black",lty=1,lwd=1)
abline(fm,col="black",lty=3,lwd=2)
#summary(fm) for R^2 :(
leg<-c(sprintf("%.2f x (R^2=%.2f)",fm0e,0.99),
       sprintf("%.2f x+ %.2f (R^2=%.2f)",fme[2],fme[1],0.93))
legend(-3,10,leg,lty=c(1,3),lwd=c(1,2))

