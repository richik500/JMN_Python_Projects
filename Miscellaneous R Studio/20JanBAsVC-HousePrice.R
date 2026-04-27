attach(house_prices)
summary(house_prices)
hist(Price)
plot(Price)
boxplot(Price, horizontal=T)
boxplot(Price~Brick)
boxplot(Price~Neighborhood)
mean(Price)
min(Price)
max(Price)
max(Price[Neighborhood=="West"])
max(Price[Neighborhood=="East"])

median(Price)
median(Price[Neighborhood=="West"])
median(Price[Neighborhood=="East"])
median(Price[Neighborhood=="North"])
b=boxplot(Price)
b$out #outlier
which(Price=='211200')
house_prices=house_prices[-104,]
View(house_prices)
b=boxplot(house_prices$Price)
b=boxplot(house_prices$Price,horizontal = T)
b$stats
median(house_prices$Price)

var(Price)
sd(Price)
# skewness kurtosis
library(moments)

skewness(Price)
kurtosis(Price)
hist(Price, freq = F)
lines(density(Price),lwd=3)

hist(SqFt)
min(SqFt)
max(SqFt)
mean(SqFt)
median(SqFt)
b1=boxplot(SqFt)
b1$out
which(SqFt==c(2590,1450))
house_prices=house_prices[-15,]
View(house_prices)  
which(SqFt==1450)
house_prices=house_prices[-65,]
View(house_prices)
b1=boxplot(house_prices$SqFt)
b1=boxplot(house_prices$SqFt,horizontal = T)
b1$stats
median(house_prices$SqFt)
var(SqFt)
sd(SqFt)
mean(house_prices$SqFt)

skewness(SqFt)
kurtosis(SqFt)
hist(SqFt, freq = F)
lines(density(SqFt),lwd=3)
cor(Price,SqFt)
plot(Price~SqFt)