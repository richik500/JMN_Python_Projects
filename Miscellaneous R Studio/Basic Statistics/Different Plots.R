a=50 #To store any data in a variable
b=70
c=a+b
g=c(1,2,3,5,6) #To store multiple data in a variable
#To Bring any data from attached excel sheet
demo$age
#To attach the whole excel datasheet
attach(demo)
#age (age column has been added)
#prof (prof column has been added)
summary(age) #to get the summary of the column
t=table(age) #to form a table and storing the vales of column in the variable
t

#Bar Plot
barplot(t)
barplot(t,col=5)#Bar Plot Color Change
barplot(t,col=c(1,2,3)) #for multiple color in same bar plot
barplot(t,col=c(1,2,3),main=" Bar plot of Age")
# for X-axis and Y-axis Labeling, X-axis and Y-axis limit increase,
#Density change & Horizontal and vertical plotting
barplot(t,col=c(1,2,3),main ="Bar Plot of Age",xlab="Age range",ylab="Person Count",
        ylim=c(0,60),xlim=c(0,5),density=80,horiz = F)

#Pie Chart
pie(t)
pie(t,radius=1,col=c(1,2,3))#To change Radius,Color


pie(t, labels = c("25-45","Below 25-45","More than 45"),edges = 35,radius = .9,col = c(2,7,4),main = "Pie Chart")
legend("topright", c("25-45","Below 25-45","More than 45"), cex = 0.8,fill=c(2,7,4)) #function of cex?
#For 3D Pie Chart-Step1. Install Plotrix, Step2. Activate Plotrix (library())
library(plotrix)
pie3D(t,radius=1,col=c(1,2,3))

#Histogram
hist(math)
hist(math,freq=F)
lines(density(math),col=3,lwd=3) #Why lwd is when increasing providing value but when decreaseing not providing value?
hist(math, col=5, main="math marks", las=2, freq=F, breaks=6) #Function of breaks?
?hist
#Line Graph
plot(math,type="l")
plot(math,type="s")
plot(math,type="h")
