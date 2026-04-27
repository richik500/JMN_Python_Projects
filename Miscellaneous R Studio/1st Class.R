var="a"
y=rep(var,10)
cat(y)
vect=c(1,2,3,4,5,6,7,8)
vect
vect=100:200
vect
vect[c(28,29,30)]
vec=c("a","b","c","d")
vec
vec=c("abra","ka","dabra")
cat(vec)
basicpay=c(5000,6000,7000,8000)
varpay=c(400,300,100,NA)
salary=basicpay+varpay
cat(salary)
which.max(salary)

mean(salary,na.rm=TRUE)  

m=c("Sachin","Sourav","Rahul","Yuvraj",NA,NA)
cat(m)
m=replace(m,is.na(m),c("Virat","Raina"))
cat(m)
which(is.na(m))
is.na(m)
sum(is.na(m))
