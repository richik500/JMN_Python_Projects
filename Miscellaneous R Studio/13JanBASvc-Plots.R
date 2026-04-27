attach(demo)
age
t=table(age)
t
#comment R codes for Bar Plot
barplot(t,main='Bar-Plot of Age',
        xlab='Age Ranges',
        ylab = 'Count',
        col=c(5,2,3),
        border='yellow',
        legend.text = T,
        ylim=c(0,60),
        density=70,
        horiz=F)
library(plotrix)
#Pie Chart
pie(t,radius=1,col=c(6,7,8),main='Pie-Chart')
pie3D(t,radius=1,col=c(6,7,8),main='Pie-Chart',
      labels = c("25-45","Below 25","More than 45"))
legend("topright",c("25-45","Below 25","More than 45"),fill=c(6,7,8))
#Histogram
hist(math,freq=F,col=2)
lines(density(math),col=8,lwd=2)

#Line Graph
plot(math,type="l",col=5)

#Box Plot
boxplot((math,horizontal=T)
boxplot(math~age,horizontal=F,col=5)
        
