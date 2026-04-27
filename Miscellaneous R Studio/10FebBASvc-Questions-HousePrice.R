attach(house_prices)
house_prices=data.frame(house_prices)
summary(house_prices)
plot(Price~SqFt)
plot(Price~Offers) # wrong -> regression-> max values outside it
cor(Price,SqFt)
cor(Price,Offers)
hist(Price) #run shapiro.test(), ad.test(), lillie.test ()
shapiro.test(Price) #0.058 p value = slightly normal as just crossed 0.05 p val
library(nortest)
ad.test(Price)
lillie.test(Price)
hist(SqFt)
shapiro.test((SqFt)) #0.8 p val = normal as lot above 0.05 p val
ad.test(SqFt)
lillie.test(SqFt)
hist(Price[Neighborhood=='East'])
ad.test(Price[Neighborhood=='East']) # whether east zone price is normal or not
qqnorm(Price)
qqline(Price)             
qqnorm(SqFt)         
qqline(SqFt)
boxplot(SqFt,horizontal = T)
boxplot(Price,horizontal=T)
t.test(Price,mu=125000) # 1 sample t test, t >2(1.96) or <2(1.96) then hypothesis rejected, 127 is degree of freedom, p value <0.05 hypothesis rejected
# above if we dont consider mu then software will consider mu = 0
mean(Price)
t.test(Price,mu=130427.3)
t.test(Price,mu=mean(Price))


# primary data is first hand data, unique - researcher, secondary data is data collected by someone else like journals, newspapers, websites
#24 feb 2025 monday 2 sample t test
library(car)
leveneTest(Price ~ Brick,data = house_prices)
# var.equal=F if not equal variance
#since p value>0.05 we should consider equal variance
t.test(Price~Brick,var.equal=T)
#p value<0.05 indicates difference exist

#paired t test
attach(paired_t_test_data)
diff=`Productivity before training`- `Productivity after training`
hist(diff)
t.test(`Productivity before training`, `Productivity after training`, paired=T,data=paired_t_test_data)
#p value is very small , there exists a significant diff ; before minus after
# in house prices check if north south east wise prices are different or not using this paired?