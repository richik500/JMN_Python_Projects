library(mice)
library(VIM)
library(Hmisc)
attach(nhanes)
d1=nhanes
View(d1)
is.na(d1)
which(is.na(d1))
sum(is.na(d1))
summary(d1)
md.pattern(d1, rotate.names = F)
md.pairs(d1)
aggr(d1, pos=1, numbers=T, las=1, sortvars=T, labels= names(d1))
pbox(d1)

# Create the MNAR dataset directly in R
mnar_data <- data.frame(
  Row = 1:25,
  Age = c(32, 45, 28, 50, 38, 62, 25, 48, 58, 35, 70, 42, 53, 30, 68, 29, 40, 63, 37, 56, 31, 67, 44, 59, 34),
  Income_INR = c(45000, 60000, 30000, 70000, 55000, NA, 28000, 62000, NA, 48000, NA, 58000, NA, 35000, NA, 33000, 50000, NA, 52000, NA, 40000, NA, 59000, NA, 46000),
  Education_Years = c(16, 14, 12, 18, 16, 10, 12, 15, 11, 16, 9, 14, 12, 13, 10, 12, 17, 9, 15, 11, 14, 10, 16, 11, 13),
  Health_Score = c(75, 68, 82, 55, 70, 45, 85, 63, 50, 78, 38, 65, 52, 80, 40, 81, 72, 43, 76, 48, 79, 41, 66, 49, 77)
)

# Display the structure of the imported data frame
print(str(mnar_data))

# View the first few rows of the imported data frame
print(head(mnar_data))
View(mnar_data)
pbox(mnar_data)
md.pattern(mnar_data)
arr_d1=d1[order(d1$age),]
View(arr_d1)


# Calculate the mean of bmi, hyp, and chl based on age groups
mean_by_age_group <- d1 %>%
  group_by(age) %>%
  summarise(
    mean_bmi = mean(bmi, na.rm = TRUE),
    mean_hyp = mean(hyp, na.rm = TRUE), # Mean of 0s and 1s for 'hyp' gives the proportion/prevalence
    mean_chl = mean(chl, na.rm = TRUE),
    .groups = 'drop' # Recommended to drop grouping after summarising
  )

# View the result
print(mean_by_age_group)

median_by_age_group <- d1 %>%
  group_by(age) %>%
  summarise(
    median_bmi = median(bmi, na.rm = TRUE),
    median_hyp = median(hyp, na.rm = TRUE),
    median_chl = median(chl, na.rm = TRUE),
    .groups = 'drop' # Recommended to drop grouping after summarising
  )

# View the result
print(median_by_age_group)
  
