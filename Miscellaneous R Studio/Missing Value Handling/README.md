# Missing Data Types & Imputation Using R | MCAR, MAR, MNAR
This repository contains a practical R project explaining different types of missing data — **MCAR, MAR, and MNAR** — along with statistical detection methods and multiple imputation techniques using real and sample datasets.
The project demonstrates how to identify missingness patterns and apply suitable handling methods for accurate analytics and predictive modeling.

## Project Objective
To understand:
- Types of Missing Data
- How missing values affect analysis
- Detection of missingness patterns
- Best imputation methods
- Multiple Imputation using MICE package

## Datasets Used

### 1. nhanes (Built-in Dataset)
Healthcare dataset commonly used for missing data analysis.
Variables include:
- Age
- BMI
- Hyp (Hypertension)
- Chl (Cholesterol)

### 2. MCAR.xlsx
Sample dataset representing **MCAR (Missing Completely At Random)** structure.

### 3. MCAR1.xlsx
Additional dataset used for comparing missingness patterns and boxplots.

## Files Included

### 1. 3rd sem_1st Class.R
R script containing:
- Missing value detection
- Missing pattern analysis
- MCAR / MAR / MNAR understanding
- Mean imputation
- Median imputation
- Multiple imputation using MICE
- Convergence diagnostics
- Final completed dataset creation

### 2. MCAR.xlsx
Excel dataset demonstrating random missing values.

### 3. MCAR1.xlsx
Excel dataset for missingness visualization and comparison.

## Libraries Used
- mice
- VIM
- Hmisc

# Understanding Missing Data Types

## 1. MCAR (Missing Completely At Random)
Missing values occur randomly and are unrelated to any variable.
### Example:
A survey page gets damaged randomly.
### Handling:
- Mean / Median Imputation
- Listwise deletion (if small %)
- Multiple Imputation

## 2. MAR (Missing At Random)
Missingness depends on another observed variable.
### Example:
Older patients skip BMI values more often.
### Handling:
- Regression Imputation
- Multiple Imputation (Best)
- Predictive Mean Matching

## 3. MNAR (Missing Not At Random)
Missingness depends on the missing value itself.
### Example:
High-income people avoid reporting salary.
### Handling:
- Advanced modeling
- Domain assumptions
- Sensitivity analysis
- 
# Techniques Used in Project

## Missing Value Detection
Used:
- `is.na()`
- `which()`
- `sum(is.na())`
- `summary()`

## Missingness Pattern Analysis
Used:
- `md.pattern()`
- `md.pairs()`
- `aggr()`
- `pbox()`
These functions identify:
- Where values are missing
- Whether patterns are random
- Relationships among missing variables
- 
# Imputation Methods Performed

## Mean Imputation
d1$bmi[which(is.na(d1$bmi))] = mean(d1$bmi, na.rm=TRUE)

## Median Imputation
d1$hyp[which(is.na(d1$hyp))] = median(d1$hyp, na.rm=TRUE)

## Multiple Imputation (MICE)
d5i = mice(d5, m=10, method=c("","pmm","pmm","pmm"))

## Why MICE is Powerful
Creates multiple possible datasets instead of one guess.
Benefits:
- Preserves variance
- Reduces bias
- Better than mean imputation
- Suitable for MAR data

## Diagnostic Checks Done
Convergence Check: plot(d5i)

## Distribution Comparison: 
stripplot(d5i)
xyplot(d5i, age ~ hyp)

## Variance Check
var(d5i$imp$bmi)
diag(var(d5i$imp$bmi))

## Final Output: 
Completed dataset created using:
d5fi = complete(d5i,6)
This selects one finalized imputed dataset for analysis.

### Key Learnings
- Missing data must be analyzed before replacing values.
- Wrong imputation can bias results.
- MCAR easiest to handle.
- MAR best handled with MICE.
- MNAR requires advanced assumptions.

### Skills Demonstrated
- Data Cleaning
- Missing Value Analytics
- Statistical Imputation
- MICE Package
- Exploratory Analysis
- R Programming
- Data Quality Management

### Business Use Cases
- Customer databases with incomplete records
- Healthcare missing patient data
- Survey response gaps
- Finance data quality issues
- Preprocessing before machine learning

### Author
Dipayan Saha
MBA in Business Analytics
