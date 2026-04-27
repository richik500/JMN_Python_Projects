# MNAR Type Missing Value Preparation in R

## Project Overview
This project focuses on understanding and preparing data with **MNAR (Missing Not At Random)** type missing values using **R**.  
MNAR occurs when the probability of missing data is related to the missing value itself. Example: people with higher income may choose not to disclose their income.
The project demonstrates how to:
- Detect missing values
- Analyze missing data patterns
- Visualize missingness
- Create a custom MNAR dataset
- Compare grouped mean and median values
- Prepare data for further imputation or modeling

## What is MNAR?
**Missing Not At Random (MNAR)** means missing values are systematically related to the unobserved value itself.

### Example:
- High-income individuals skip salary questions  
- Patients with severe illness skip health surveys  
This type of missing data is the most complex and requires careful treatment.

## Libraries Used
mice
VIM
Hmisc

## Dataset Used

### 1. Built-in Dataset: `nhanes`
Used for practicing missing value detection and pattern analysis.
Contains variables such as:
* Age
* BMI
* Hypertension
* Cholesterol

### 2. Custom MNAR Dataset Created
A manually created dataset containing:
| Variable        | Description                              |
| --------------- | ---------------------------------------- |
| Row             | Record Number                            |
| Age             | Age of Person                            |
| Income_INR      | Monthly Income (contains missing values) |
| Education_Years | Years of Education                       |
| Health_Score    | Health Indicator Score                   |

In this dataset, several **Income_INR** values are intentionally missing to simulate **MNAR behavior**.

## Project Workflow

### 1. Missing Value Detection
Used functions:
is.na()
which(is.na())
sum(is.na())
summary()

To identify:
* Missing locations
* Total missing count
* Variable summaries

### 2. Missing Pattern Analysis
Used:
md.pattern()
md.pairs()

To understand:
* Which variables are missing together
* Frequency of missing combinations

### 3. Missing Value Visualization
Used:
aggr()
pbox()

To visually inspect:
* Missingness distribution
* Patterns across variables
* Possible relationships

### 4. Custom MNAR Dataset Creation
Created a real-world style dataset where missing values appear mainly in **Income_INR** column.
This simulates respondents hiding income details.

### 5. Sorted Data Analysis
Sorted records by age to observe structured trends:
order(age)

### 6. Grouped Mean and Median Analysis
Calculated grouped statistics by Age:
* Mean BMI
* Mean Hypertension
* Mean Cholesterol
* Median BMI
* Median Cholesterol
Used to compare age-wise trends despite missing values.

## Key Concepts Learned
* Difference between MCAR, MAR, and MNAR
* Missing data diagnostics in R
* Pattern visualization
* Realistic MNAR simulation
* Descriptive statistics with missing values
* Data preparation before imputation
  
## Business Use Cases
MNAR data commonly appears in:
* Banking (hidden income)
* Healthcare (unreported conditions)
* Surveys (sensitive questions skipped)
* HR Analytics (salary non-disclosure)
Understanding MNAR helps improve decision-making accuracy.

## Project Files
| File Name                    | Description                                        |
| ---------------------------- | -------------------------------------------------- |
| R Codes_Missing Value Prep.R | Complete R code for MNAR missing value preparation |

## How to Run
1. Open R / RStudio
2. Install required packages
3. Run the script file
4. Review missing value patterns and outputs

## Conclusion
This project provides practical exposure to handling **MNAR missing values**, one of the most challenging data quality problems in analytics and machine learning.

## Author
Dipayan Saha