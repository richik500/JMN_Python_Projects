attach(ANOVA)
summary(ANOVA)

#Null hypothesis: No significant difference within the departments in terms of mean values.

type=as.factor(type)
summary(type)
library(car)
leveneTest(sales,type,data=ANOVA)

#Checking of variance:
#H0: Equal variance
#H1: Unequal variance
#Here, p<0.05 --> Unequal variance

#For equal variance: aov
#For unequal variance: one way.test

oneway.test(sales~type,data = ANOVA)

#ANOVA
#H0: Sales are statistically equal, here, p<0.05 -->Unequal
#H1: Sales are not statistically equal

#For aov --> Tuckeyttsd
#For one way.test --> Games howell test <--"rstatix"

library(rstatix)
games_howell_test(sales~type,data=ANOVA)

#dd(A)   fdh(B) --> 9X10(to the power -1) --> 0.9> 0.5
#dd(A)   mkt(C) --> p<0.05
#fdh(B)  mkt(C) --> P<0.05

#   e-x  --> 10(to the power -x)
#1) e-1  --> 10(to the power -1)
#2) e-13 --> 10(to the power -13)
#3) e-13 --> 10(to the power -13)

a=aov(sales~type,data=ANOVA)
a
summary (a)
b=TukeyHSD(a)
b
plot(b)
# as the p value is 0.999 (near 1)so it is touching the dotted line. 



attach(data)
summary(data)

#Null hypothesis: No significant difference within the departments in terms of mean values.

type=as.factor(type)
summary(type)
library(car)
leveneTest(sales,type,data = data)

#Checking of variance:
#H0: Equal variance
#H1: Unequal variance
#Here, p<0.05 --> Unequal variance

#For equal variance: aov
#For unequal variance: one way.test

oneway.test(sales~type,data = data)

#ANOVA
#H0: Sales are statistically equal, here, p<0.05 -->Unequal
#H1: Sales are not statistically equal

#For aov --> Tuckeyttsd
#For one way.test --> Games howell test <--"rstatix"

library(rstatix)
games_howell_test(sales~type,data=data)

#dd(A)   fdh(B) --> 9X10(to the power -1) --> 0.9> 0.5
#dd(A)   mkt(C) --> p<0.05
#fdh(B)  mkt(C) --> P<0.05

#   e-x  --> 10(to the power -x)
#1) e-1  --> 10(to the power -1)
#2) e-13 --> 10(to the power -13)
#3) e-13 --> 10(to the power -13)

a=aov(sales~type,data=data)
a
summary (a)
b=TukeyHSD(a)
b
plot(b)
# as the p value is 0.999 (near 1)so it is touching the dotted line. 















