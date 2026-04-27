library(VIM)
attach(missingdatacsv)
d1=missingdatacsv
dim(d1)
anyNA((d1))
is.na(d1)
which(is.na(d1))
# treats the matrix as a single long vector, ordered column by column. It then returns the 1-dimensional indices of the TRUE values in that flattened vector.
sum(is.na(d1))
summary(d1)
library(mice)
md.pattern(d1,rotate.names=F)
#26 rows no missing value (0 total cols), 6 rows 1 missing value (1 total cols)
# red means missing value in graph
md.pairs(d1) # 4 diff matrices , rr means where both are available, rm where row(i) is observed but column j is missing,
# mr means row is missing but column is observed, mm where both are missing
aggr(d1,pos=1,number=T,las=1,sortVars=T,labels=names(d1))
#graph means v1 has 50% data missing, visualize problematic zones, delete v1 if not imp for study / ignore v1

# 32 July 2025 - missing values
library(Hmisc)
attach(nhanes)
d1=nhanes
View(d1)
#library(writexl)
#write_xlsx(d1, path="output1.xlsx")
is.na(d1)
which(is.na(d1))
sum(is.na(d1))
summary(d1)
md.pattern(d1, rotate.names = F)
# blue means available, red means missing, 13 rows where no missing values, complete set of data available in 13 rows
# 3 rows have 1 missing value in cholesterol ; 
md.pairs(d1)
# rr means row data available, column data available, diagonal values are available data
# rm means row availability but column missing , bmi available but hypertension missing ,[2row4col] bmi available but cholestrol missing 3 cases
# mr row missing column available 
# mm missing missing 
# most vulnerable - cholesterol - 10 missing values
aggr(d1,pos=1,numbers=T,las=1,sortVars=T,labels=names(d1))
# 1st graphical representation - percentage of missing of chl,bmi,hyp wrt each other
# 2nd graph - hyp and bmi are missing together : MAR; 28% data absent where chl,bmi,hyp missing; 
# 2nd graph - 28+4 % missing where bmi and hyp missing : 32% where hyp missing if bmi missing
pbox(d1)
# white means reference data here that age is having no missing value, blue is present, red is missing values
# IF it was MCAR, then shd have been missingness & availability of bmi would be same more or less, wrt age 
# when age is higher, missingness is high for chl; lower level of age - lower chl data available
# this not MCAR 
# bmi missingness is more in lower age range
# MCAR shd have been - ideal case case shd be present and missingness values shd more or less be coinciding
# likely MAR from this graph 
#

# mean imputation
d1$bmi[which(is.na(d1$bmi))]=mean(d1$bmi,na.rm=T)
d1
d2=nhanes
summary(d2$hyp)
d2$hyp=as.factor(d2$hyp)
summary(d2$hyp)
d2i=mice(d2,maxit=10,m=10,method =c( "", "pmm", "pmm", "pmm"),print=F)
d2i# diagonal 0 means variable not used by predictor
# like 1st row meaningless as age available, 2nd row bmi is predicted by pther 3 variables : meaning of the 1 0 1 1 : we are doing this as we assuming it is MAR
# maxit if errror; m is iteration num
# multiple imputation by chain equation 1 then 2 then 3 iterations of regression one by one
# 10 iterations - mice will provide 10 diff columns - we have to choose 1
# for 10, we avoid initial imputed value and last one, we prefer middle ones
# we also check variance of the imputed values - assume variance ranges from 5 to 50: more or less medium position of variance[ not less variance as problem with less variance is imputed values is close to each other : it is close to mean imputation: if variance is very low and we choose that column - we could have run mean imputation also instead.]
# hence choose medium of the options- needs domain knowledge - we can also choose average of 2-3 column data we like. Higher variance is also problematic - some values may also cross the acceptance label - bmi very high - for the individual other things maybe good since
# check monte carlo simulation process
# Methods: pmm - predictive mean matching
# logreg - logistic regression :when data binary0,1
# polyreg - unordered multi category - polynomial regression
# polr - for ordered factor :also polynomial regression ; lets say age is missing 1,2,3 ordered categories 
# put cursor on mice and it will show other methods, also when to use
# pmm method better than mean imputation; mean imputation is not good for this data: if simple problem go for simple method: tradeoff

#Checking of Convergence
plot(d2i)
# mean and sd : stable and flat : shows convergence
stripplot(d2i) # only applicable for numerical values
# blue means available data, red means missing places :well mixed and they are close - imputed values are reliable and consistent with the observed data
# imputed values are close to observed values 
# no cluster no outlier present
# so we can say for bmi and chl, pmm method works well

xyplot(d2i,bmi~hyp)
#devoff()
# imputed values overlap with observed values, which is expected ; no visual anomalies indicating stable and trustworthy imputation
# pmm method working correctly

summary(d2$bmi)
d2i$imp$bmi
var(d2i$imp$bmi) #variance : Diagonals are variances ; others are co-variances
diag(var(d2i$imp$bmi)) # dont choose extreme or low variance
# choose 6th here as middle and values middle :16.892500  6.593611  9.480000 20.987500 32.850000 [[12.445278]] 16.855000  5.528611 10.328611  8.701111 
d2fi=complete(d2i,6) #final imputation
View(d2fi)
