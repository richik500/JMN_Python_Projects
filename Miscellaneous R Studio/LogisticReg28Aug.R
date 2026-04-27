# lm beta package, standardised coefficient, interaction term, correlation heatmap, glm for logistic regression
# (actual - predicted ): histogram/ density curve/qqplot: expect normal
# error shd be normally distributed when scatterplot is circle type. Normally distributed means Mean(error) is 0 and 
# Correlation bw (Error & Independent Variables) - heatmap/boxplot. Corr high means residual info roye roeche, we arent able to extract all info
attach(LR.data)
d1=LR.data
# View(d1)
summary(d1)
# for missing data assignment
#model=lm(y~)
#model=lm(y~len+h+..)
#summary(model)
Credit.card=factor(Credit.card,levels=c(0,1),labels=c("not approved","approved"))
summary(Credit.card)
library(ggplot2)
library(GGally)
ggpairs(d1,columns = c(2, 3),aes(colour = as.factor(Credit.card)))

# Partition (80-20)
set.seed(123)
# runif(5)
ind=sample(2,nrow(d1),replace=T,prob=c(0.8,0.2))
ind
train=d1[ind==1,] # all data where 1 is mentioned
test=d1[ind==2,] # all data where 2 is mentioned
train
test
# write lm inplace of glm if want to run regression on trained set
# residual deviance shd decrease more after inducing other var & income
model=glm(Credit.card~Income+Other.feed.back,data=train,
          family=binomial(link="logit"))
summary(model)
# other feedback is significant compared to income wrt p value.
# null deviance - when there is no predictors. A measure of how well the response is predicted by a model with only an intercept (no predictors). Lower is better.
# residual deviance - after inclusion of predictor what is the difference.  A measure of how well the response is predicted by the model when the predictors are included. You want this value to be substantially lower than the Null Deviance.
# AIC value- our target to find model where AIC is minimum - good for the model
# AIC (Akaike Information Criterion): A metric for comparing models. It balances model fit with model complexity. Lower AIC values are generally preferred.
m1=predict(model,train)
head(m1)
y=-0.9513822
p=exp(y)/(1+exp(y))
p
p1=predict(model,train,type='response')
p1
pred1=ifelse(p1>0.5,'approved','not approved') #confusion matrix of train dataset
pred1
tab1=table(predicted=pred1, actual=train$Credit.card)
tab1
# calculate sensitivity specificity etc
p2 =predict(model,test,type='response')
pred2=ifelse(p2>0.5,1,0) # confusion matrix of test dataset
tab2=table(actual=test$Credit.card,predicted=pred2)
tab2


library(caret)
cm1=confusionMatrix(pred1,train$Credit.card, positive = 'approved') # NOT WORKING

#------------------------------------------------------------------
# CHATGPT : Make sure the reference has the intended levels in order
train$Credit.card <- factor(train$Credit.card, 
                            levels = c("not approved","approved"))
test$Credit.card  <- factor(test$Credit.card, 
                            levels = c("not approved","approved"))

# Turn 0/1 predictions into a factor with the SAME labels
pred1_f <- factor(pred1, levels = c(0,1), 
                  labels = c("not approved","approved"))
pred2_f <- factor(pred2, levels = c(0,1), 
                  labels = c("not approved","approved"))


cm1 <- confusionMatrix(data = pred1_f, 
                       reference = train$Credit.card, 
                       positive = "approved")
cm1

cm2 <- confusionMatrix(data = pred2_f, 
                       reference = test$Credit.card, 
                       positive = "approved")
cm2
#-----------------------------------------------------------------


#SUVENDU SIR FINAL LOGISTIC REGRESSION-----------------------------------
# ==========================
# Logistic Regression Example
# ==========================

# Load & inspect
data <- LR_data
summary(data)

# Ensure dependent variable is factor with proper labels
data$`Credit card` <- factor(data$`Credit card`,
                             levels = c(0,1),   # adjust if original coding differs
                             labels = c("notapproved","approved"))
summary(data$`Credit card`)

# ---------------------
# EDA with ggpairs
# ---------------------
library(ggplot2)
library(GGally)
ggpairs(data, columns = c(2,3), ggplot2::aes(colour = data$`Credit card`))

# ---------------------
# Partition of data (80/20 split)
# ---------------------
set.seed(123)
ind <- sample(2, nrow(data), replace = TRUE, prob = c(0.8,0.2))
train <- data[ind==1,]
test  <- data[ind==2,]

# ---------------------
# Logistic regression model
# ---------------------
mymodel <- glm(`Credit card` ~ Income + `Other feed back`,
               data = train,
               family = binomial(link = "logit"))
summary(mymodel)

# ---- Prediction on train set ----
p1 <- predict(mymodel, train)
p1
y=-0.9513822228
exp(y)/(1+exp(y))
p1 <- predict(mymodel, train, type = "response")
p1
# Convert probabilities to factor predictions

pred1 <- factor(ifelse(p1 > 0.5, "approved", "notapproved"),
                levels = c("notapproved","approved"))
pred1

# Confusion matrix - train
tab1 <- table(actual = train$`Credit card`, predicted = pred1)
tab1

# Misclassification error - train
train_error <- 1 - sum(diag(tab1)) / sum(tab1)
train_error

# ---- Prediction on test set ----
p2 <- predict(mymodel, test, type = "response")

pred2 <- factor(ifelse(p2 > 0.5, "approved", "notapproved"),
                levels = c("notapproved","approved"))

# Confusion matrix - test
tab2 <- table(actual = test$`Credit card`, predicted = pred2)
tab2

# Misclassification error - test
test_error <- 1 - sum(diag(tab2)) / sum(tab2)
test_error

# ---------------------
# Plot S-curves
# ---------------------
train$`Credit card` <- relevel(factor(train$`Credit card`), ref = "notapproved")

ggplot(train, aes(x = Income, y = as.numeric(`Credit card`)-1)) +
  geom_point(aes(color = `Credit card`)) +
  stat_smooth(method = "glm",
              method.args = list(family = "binomial"),
              formula = y ~ x, se = F) +
  labs(y = "Probability(approved)", title = "Logistic Regression S-curve (Income)")



test$`Credit card` <- relevel(factor(test$`Credit card`), ref = "notapproved")

ggplot(test, aes(x = Income, y = as.numeric(`Credit card`)-1)) +
  geom_point(aes(color = `Credit card`)) +
  stat_smooth(method = "glm",
              method.args = list(family = "binomial"),
              formula = y ~ x, se = F) +
  labs(y = "Probability(approved)", title = "Logistic Regression S-curve (Income)")



# ---------------------
# 3D Probability Surface
# ---------------------
library(plotly)

income_seq <- seq(min(train$Income), max(train$Income), length.out = 50)
feedback_seq <- seq(min(train$`Other feed back`), max(train$`Other feed back`), length.out = 50)

grid <- expand.grid(Income = income_seq, `Other feed back` = feedback_seq)

grid$prob <- predict(mymodel, newdata = grid, type = "response")

z_matrix <- matrix(grid$prob, nrow = length(income_seq), ncol = length(feedback_seq))

plot_ly(
  x = income_seq,
  y = feedback_seq,
  z = z_matrix,
  type = "surface"
) %>%
  layout(
    scene = list(
      xaxis = list(title = "Income"),
      yaxis = list(title = "Other feedback"),
      zaxis = list(title = "Probability(Approved)")
    )
  )

# ---------------------
# ROC Curve & AUC
# ---------------------
library(pROC)
library(caret)
roc_train <- roc(train$`Credit card`, p1, levels = c("notapproved", "approved"))
roc_test  <- roc(test$`Credit card`,  p2, levels = c("notapproved", "approved"))

plot(roc_train, col = "darkgreen", lwd = 2, main = "ROC Curves (Train & Test)")
plot(roc_test, col = "blue", lwd = 2, add = TRUE)
abline(a = 0, b = 1, lty = 2, col = "red")

legend("bottomright",
       legend = c(paste("Train AUC =", round(auc(roc_train),3)),
                  paste("Test AUC =", round(auc(roc_test),3))),
       col = c("darkgreen", "blue"), lwd = 2)

# ---------------------
# Precision, Recall, F1-score
# ---------------------
library(caret)

# Train metrics
train_conf <- confusionMatrix (pred1, train$`Credit card`, positive = "approved")
train_conf

# Test metrics
test_conf <- confusionMatrix(pred2, test$`Credit card`, positive = "approved")
test_conf
