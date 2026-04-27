# One-Way ANOVA: Car vs Jeep vs Truck Sales Analysis in R
This repository contains a One-Way ANOVA project using R to compare average sales performance among three vehicle categories: Car, Jeep, and Truck.

## Project Objective
To determine whether mean sales differ significantly among:
- Car
- Jeep
- Truck
and identify which categories perform better.

## Dataset Used
1wayanova.xlsx
Contains:
- Sales
- Vehicle Type

## Tools Used
- R
- RStudio
- Excel

## Analysis Performed

### Data Preparation
- Dataset summary
- Convert type variable into factor labels:
  - Car
  - Jeep
  - Truck

### Assumption Testing
- Levene’s Test for equality of variance

### Statistical Tests
- Welch One-Way ANOVA
- Standard One-Way ANOVA
- Games-Howell Post Hoc Test
- Tukey HSD Pairwise Comparison

## Hypothesis

### ANOVA
H0: Mean sales of Car, Jeep, and Truck are equal
H1: At least one vehicle category has different mean sales

### Levene's Test
H0: Variances are equal across groups
H1: Variances are unequal

## Significance Level
α = 0.05

## Decision Rule
- p-value < 0.05 → Reject H0
- p-value > 0.05 → Fail to reject H0

## Business Value
- Compare category performance
- Improve product mix strategy
- Identify top-selling vehicle segment
- Support inventory and pricing decisions

## Files Included
- 1wayanova.xlsx
- 1way_ANOVA_Test.R

## Skills Demonstrated
- ANOVA Testing
- Post Hoc Analysis
- Sales Analytics
- Statistical Decision Making
- R Programming

## Author
Dipayan Saha 
MBA in Business Analytics
