attach(Tractor_Sales)
t=as.data.frame(Tractor_Sales)
t
plot(t[,2])
plot(t[,2],type="l")
ts=ts(t[,2],frequency = 12, start=c(2003,1))
ts
plot(ts,xlab="year",ylab="sales",main="Tractor Sales")
# in jan (0.82) the sales is 18% less than overall year trend
library(fpp2)
ggseasonplot(ts,year.labels=T,year.labels.left = T,ylab="sales")
ggseasonplot(ts,polar=T)
ts
monthplot(ts, ylab="sales", xlab="months")
td=decompose(ts, type= "multiplicative")
td
plot(td)
t1=window(ts,start=c(2003,1),end=c(2012,12),freq=12)
t2=window(ts,start=c(2013,1),end=c(2014,12),freq=12)
library(forecast)
autoplot(t1,col=4,ylab="sales",main="Blue:Train set and Red:Test set")+autolayer(t2)
t1s=ses(t1,h=24) #simple exponential smoothing
summary(t1s)
plot(t1s)

t1h=holt(t1,h=24) #double exponential smoothing
summary(t1h)
plot(t1h)

t1w=hw(t1,h=24, seasonal="multiplicative") #triple exponential smoothing
summary(t1w)
plot(t1w)

t1w=data.frame(t1w)
acw=cbind(t2,t1w[,1])
t1w
ts.plot(acw,col=c("blue","red"))
accuracy(t2,t1w[,1])
#mape = 7.7 i.e. it is 7% away from the root
#rms = 49 means we are 68% sure
#mpe = 7 means the prediction is 7% underpredicted

#Triple Exponential Smoothing Interpretation
#plot(t1w) =>>>below
#alpha = 0.35, beta = 0.01, gamma = 0.64, s = 0.95, 0.75, ...
# alpha close to 0 means our label is not changing