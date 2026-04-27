library(VIM)
library(mice)
library(Hmisc)
attach(md) #csv readr
d1=md
View(d1)
dim(d1)
anyNA(d1)
is.na(d1)
which(is.na(d1))
sum(is.na(d1))
summary(d1)
md.pattern(d1,rotate.names=T)
md.pairs(d1)
aggr(d1,pos=1,number=T,las=1,sortVars=T,labels=names(d1))
pbox(d1)
summary(d1$Income)
summary(d1$Other_feedback)
d2=md
d2$Credit_card=as.factor(d2$Credit_card)
summary(d2$Credit_card)
d2i=mice(d2,maxit=2,m=10,method =c( "", "pmm", "pmm"),print=T)
View(d2i)
plot(d2i)
#checking of convergence
stripplot(d2i)
xyplot(d2i,Income~Credit_card)

d2i$imp$Income
sqrt(diag(var(d2i$imp$Income)))
d2fi=complete(d2i,6)
View(d2fi)
