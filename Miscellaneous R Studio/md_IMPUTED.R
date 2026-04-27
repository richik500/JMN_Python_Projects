library(mice)
library(VIM)
library(Hmisc)
attach(md1)
d1=md1
View(d1)
is.na(d1)
which(is.na(d1))
sum(is.na(d1))
summary(d1)
md.pattern(d1)
md.pairs(d1)
aggr(d1,pos=1,numbers=T,las=1,sortVars=T, labels=names(d1))
pbox(d1)



d2i=mice(d2,maxit=2,m=10,method = c("","pmm","pmm"),print=T)
View(d2i)
plot(d2i)
#checking of convergence
plot(d2i)
stripplot(d2i)
xyplot(d2i,Income~Credit_card)
dev.off()

summary(d2$bmi)
d2i$imp$Income
sqrt(diag(var(d2i$imp$Income)))
d2fi=complete(d2i,6)
View(d2fi)
