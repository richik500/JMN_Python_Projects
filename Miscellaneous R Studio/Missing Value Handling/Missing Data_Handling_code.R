library(mice)
library(VIM)
library(Hmisc)
attach(nhanes)
d1=nhanes
View(d1)
is.na(d1)
which(is.na(d1))
sum(is.na(d1))
summary(d1)
md.pattern(d1)
md.pairs(d1)
aggr(d1,pos=1,numbers=T,las=1,sortVars=T, labels=names(d1))
pbox(d1)

attach(MCAR)
d2=MCAR
pbox(d2)
md.pattern(d2)

attach(MCAR1)
d3=MCAR1
pbox(d3)

#mean imputation

d1$bmi[which(is.na(d1$bmi))]=mean(d1$bmi,na.rm = T)
d1

#median imputation

d1$hyp[which(is.na(d1$hyp))]=median(d1$hyp,na.rm = T)
d1

d5=nhanes
d5$hyp=as.factor(d5$hyp)
summary(d5$hyp)

d5i=mice(d5,m=10, method = c("","pmm","pmm","pmm"),print=F)
d5i

#checking of convergence
plot(d5i)
stripplot(d5i)
xyplot(d5i,age~hyp)

summary(d5$bmi)
d5i$imp$bmi
var(d5i$imp$bmi)
diag(var(d5i$imp$bmi))

d5fi = complete(d5i,6)
View(d5fi)
