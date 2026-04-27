# Data Cleaning and Pre Processing

# Excel File Description for README
This dataset contains Household Consumption Expenditure Survey (HCES) 2023–24 imputation rate data. It includes sector, state, questionnaire items, item descriptions, and rate-per-unit measures used for statistical analysis, missing value treatment, scaling, and outlier detection.

# Excel Data Cleaning and Preprocessing Using Python
This folder contains a Python hands-on project focused on loading, cleaning, preprocessing, and scaling an Excel dataset using Pandas and Scikit-learn.

## Files Included

### 1. hces_data_preprocessing.py
Python script covering:
- Reading Excel files using Pandas
- Handling headers
- Checking missing values
- Removing empty rows
- Filling missing values using median and mode
- Feature scaling using MinMaxScaler
- Standardization using Z-score
- Outlier detection using IQR method

### 2. HCES_2023_24_Imputation_Rate.xlsx
Household Consumption Expenditure Survey dataset containing:
- Sector details
- State codes
- Questionnaire items
- Free item descriptions
- Rate per unit (Mode based)
- Rate per unit (25th Percentile based)

## Libraries Used
- pandas
- scikit-learn

## Data Preprocessing Techniques Used

### Missing Value Handling
- Median imputation for numeric columns
- Mode imputation for categorical columns

### Feature Scaling
- Min-Max Scaling
- Standardization (Z-score)

### Outlier Detection
- Interquartile Range (IQR) Method

## Skills Demonstrated
- Excel Data Analysis
- Data Cleaning
- Feature Engineering
- Preprocessing
- Outlier Detection
- Python for Analytics

## Business Use Case
Prepare raw survey data for statistical analysis, machine learning models, and reporting.

## Author
Dipayan Saha 
MBA in Business Analytics
