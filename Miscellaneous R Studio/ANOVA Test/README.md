# ANOVA Test in R
This repository contains ANOVA project using R to compare average sales across multiple categories/groups. It helps determine whether significant differences exist between group means.

## Objective
To test whether mean sales differ significantly across different product/category types.

## Dataset Used
ANOVA.xlsx
Contains:
- Sales
- Category Type

## Tools Used
- R
- RStudio
- Excel

## Analysis Performed

### Preliminary Testing
- Summary Statistics
- Factor Conversion
- Levene’s Test for Equality of Variance

### Main Statistical Tests
- Welch One-Way Test (`oneway.test`)
- One-Way ANOVA (`aov`)
- Games-Howell Post Hoc Test
- Tukey HSD Multiple Comparison Test

### Visualization
- Tukey HSD Plot for mean comparison

## Hypothesis

### ANOVA
H0: Mean sales of all categories are equal
H1: At least one category mean is different

### Levene’s Test
H0: Variances are equal across groups
H1: Variances are not equal

## Significance Level
α = 0.05

## Decision Rule
- p-value < 0.05 → Reject H0
- p-value > 0.05 → Fail to reject H0

## Business Value
- Compare product/category performance
- Identify top-performing segments
- Improve pricing and sales strategy
- Support data-driven decisions

## Files Included
- ANOVA.xlsx
- ANOVA_Test.R

## Skills Demonstrated
- ANOVA Testing
- Post Hoc Analysis
- Business Statistics
- R Programming
- Data Interpretation

## Author
Dipayan Saha
MBA in Business Analytics
