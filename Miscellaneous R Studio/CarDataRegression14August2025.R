library(VIM)
library(mice)
library(Hmisc)
attach(imports_85)
View(imports_85)
dat=imports_85
t(head(dat,2))
t(summary(dat))
make=as.factor(make)
summary(make)
fuel.type=as.factor(fuel.type)
summary(fuel.type)
# fuel type has low variation ; 1st task is to put whole correlation matrix
aspiration=as.factor(aspiration)
summary(aspiration)
# compared to previous fuel-type, it is better
num.of.doors=as.factor(num.of.doors)
summary(num.of.doors)
which(is.na(num.of.doors))
# the dodge 28 shd have 4 doors : sedan according to domain knowledge, same for mazda : sedan
body.style=as.factor(body.style)
summary(body.style)
# more or less ok
drive.wheels=as.factor(drive.wheels)
summary(drive.wheels)
# 4wd shd be rare car and costly according to domain knowledge; rwd is for mid to high
# we can wrt price the boxplot of these categories and if 4wd and rwd are same then can merge 4wd with rwd
b=boxplot(`compression-ratio`)
b$out #outlier? peogot make compression ratios
which(`compression-ratio`==23)
# from pairplot identify the density function adn scatterplots if dots are spreaded like a circle
# <.5 = fluke relationship possible in correlation; check rsquare for each
# r square kome jaoa means relation maybe?
# do pairplot
# not to predict compression rat
# overll correlation is low; showing 2 diff clusters; if we separare calculate correlation 185 data correlation is very low; for 20 data it is also not crossing our threshold; so compression ratio hopeflly not impacting price                                    )
# if we took compression ratio, then it would be x bar y bar wont pass through both clusters in a reliable way
# calculated average is not truly representative of the whole data; model is also passing through that point, x bar y bar won't be reliable
# if only for gas cars then corr maybe done
summary(dat$`compression-ratio`) # mean of compression ratio
mean(dat$`compression-ratio`[`fuel-type`=="gas"])
sd_compression_ratio <- sd(dat$`compression-ratio`, na.rm = TRUE)
sd_compression_ratio

# Codes from Gairik
Car1=imports_85
# ChatGpt(diesel Comp ratio corr vs d Car price)
Di=diesel_cars <- subset(Car1, `fuel-type` == "diesel")
Di
G=gas_cars <- subset(Car1, `fuel-type` == "gas")
View(G)
#diesel
diesel_cars$`compression-ratio` <- as.numeric(diesel_cars$`compression-ratio`)
diesel_cars$price <- as.numeric(diesel_cars$price)
diesel_cars <- na.omit(diesel_cars[, c("compression-ratio", "price")])
cor(diesel_cars$`compression-ratio`, diesel_cars$price)
#gas
gas_cars$`compression-ratio` <- as.numeric(gas_cars$`compression-ratio`)
gas_cars$price <- as.numeric(gas_cars$price)
gas_cars <- na.omit(gas_cars[, c("compression-ratio", "price")])
cor(gas_cars$`compression-ratio`, gas_cars$price)
mean(`compression-ratio`)
min(`compression-ratio`)
max(`compression-ratio`)
#checking the reliability of mean
sd(`compression-ratio`)
mean(`compression-ratio`)
3.97204/sqrt(205)
0.2774193/10.14







# generally 50+8*NoOfIndependentVariables req to make regression
# handle missing value type  for NA
# if mar then mice is bets option
# if var not imp from domain know -- missing val
# if less missing val like 1, then not useful to do imputation- use median instead
# check frequency to check if enough variation or not
# low variance of cylinder - price high variance : can drop it if using domain knowledge also not important much
# if ratio of data collected not as expected like petrol:diesel then purposevely collect more data as required like if diesel is low  then collect more diesel data
# which variable is more prone to measurement error : measurement of car, wheel base
# length is manual measurement - high chance of error; whereas horsepower is written beforehand so hp has less emasurement error
# continuously outlier detection may make the graph as skewed (1.96)
# sns.pairplot in python - fixed picture in r , can move in python
freq=lapply(dat,function(dat){lengths(unique(dat))})
summary(freq)
# normalised loss lot of missing value 
#dat=dat{-c(1,2,3,4,5,6,7,8,9)}
dat=dat[-c(1:9)]
View(dat)
# in real project use separate regression models for different country models of cars
# we can also do category wise : premium , non - premium
# if categorical values are important for the analysis and follows a qualitative order, then we can replace those categories by numerical values (1,2,3,...) example they have order like educational level.
# if any categorical variable having no order, qualitatively no order, then we have to use one hot coding.
# one hot coding only use when categories not having any order liek M,F
# if more or less equally distributed then variance exists, like  gas 10 diesel 190 shd have low deviation








d1=imports_85
dim(d1)
anyNA((d1))
is.na(d1)
which(is.na(d1))
sum(is.na(d1))
summary(d1)
library(dplyr)
library(stringr)

make=as.factor(make)
summary(make)
fuel.type=as.factor(fuel.type)
summary(fuel.type)
aspiration=as.factor(aspiration)
summary(aspiration)
num.of.doors=as.factor(num.of.doors)
summary(num.of.doors)
body.style=as.factor(body.style)
summary(body.style)
drive.wheels=as.factor(drive.wheels)
summary(drive.wheels)
drive.wheels=as.factor(drive.wheels)
summary(drive.wheels)
engine.location=as.factor(engine.location)
summary(engine.location)
engine.type=as.factor(engine.type)
summary(engine.type)
fuel.system=as.factor(fuel.system)
summary(fuel.system)
fuel.system=as.factor(fuel.system)
summary(fuel.system)

md.pattern(d1,rotate.names=T)
md.pairs(d1)

library(readr)
library(dplyr)

# Step 2: Clean column names (replace "-" with ".")
names(d1) <- gsub("-", ".", names(d1))

# Step 3: Convert character columns to numeric codes
d1[] <- lapply(names(d1), function(colname) {
  if (is.character(d1[[colname]])) {
    if (colname == "engine.type") {
      # Apply custom mapping for engine.type
      as.numeric(factor(
        d1[[colname]],
        levels = c("l", "ohc", "ohcf", "ohcv", "dohc", "dohcv", "rotor")
      ))
    } else {
      # Default numeric coding for other character columns
      as.numeric(factor(d1[[colname]]))
    }
  } else {
    as.numeric(as.character(d1[[colname]]))  # Keep numeric as numeric
  }
})

# Restore column names after lapply
names(d1) <- gsub("-", ".", names(d1))

# Step 4: Verify transformation
str(d1)

# Step 5: Calculate correlation with price
cor_results <- sapply(names(d1)[names(d1) != "price"], function(col) {
  cor(d1$price, d1[[col]], use = "complete.obs", method = "pearson")
})

# Step 6: Create a table sorted by absolute correlation
cor_table <- data.frame(
  Variable = names(cor_results),
  Correlation_with_Price = round(cor_results, 3)
) %>% arrange(desc(abs(Correlation_with_Price)))

# View the table
print(cor_table)












library(readr)

# Read dataset
data <- attach(imports.85)

# Replace "-" with "." in column names
names(data) <- gsub("-", ".", names(data))

# Convert to numeric
data$bore <- as.numeric(as.character(data$bore))
data$horsepower <- as.numeric(as.character(data$horsepower))

# Calculate correlation
cor_bore_hp <- cor(data$bore, data$horsepower, use = "complete.obs", method = "pearson")

print(cor_bore_hp)

#pairplot