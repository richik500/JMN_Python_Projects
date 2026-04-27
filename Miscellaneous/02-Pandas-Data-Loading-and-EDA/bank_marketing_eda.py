# Importing necessary libraries
import pandas as pd # We are asking pandas library to execute/complete the task

#loading the dataset
data_path = '/content/bank-additional-full.csv'
bank_data = pd.read_csv(data_path, sep=';') # We want the data to be comma seperated. So that the data is properly arrange and we are able to check it
# We use sep=';' when the data is actually unstructured and need to be arranged in the column/Row wise manner.

# Display basic information and sample data
bank_data.info(), bank_data.head()

# Exploratory Data Analysis (EDA)

import matplotlib.pyplot as plt
import seaborn as sns

# Check for missing values
missing_values = bank_data.isnull().sum()

# Distribution of target variable 'y'
target_distribution = bank_data['y'].value_counts()

#Visualizing distribution of the target variable
plt.figure(figsize=(8, 5))
sns.countplot(x='y', data=bank_data)
plt.title('Distribution of Target Variable (y)')
plt.xlabel('subscription of Term Deposit')
plt.ylabel('Count')
plt.show()

import matplotlib.pyplot as plt
import seaborn as sns

# Correlation heatmap of the numeric variables
plt.figure(figsize=(12, 8))
numeric_features = bank_data.select_dtypes(include=['int64','float64'])
sns.heatmap(numeric_features.corr(), annot=True, cmap='coolwarm')
plt.title('Correlation Heatmap of Numeric Variables')
plt.show()

# Checking Dataframe attributes
data_shape = bank_data.shape
data_columns = bank_data.columns
data_index = bank_data.index
data_value_sample = bank_data.values[:5]
data_dtypes = bank_data.dtypes
data_head = bank_data.head(2)
data_tail = bank_data.tail(2)
data_info = bank_data.info()
data_describe = bank_data.describe()
data_sample= bank_data.sample(5)

# Displaying the results
print("Data Shape:", data_shape)
print("Data Columns:", data_columns)
print("Data Index:", data_index)
print("Data Value Sample:", data_value_sample)
print("Data Dtypes:", data_dtypes)
print("Data Head:", data_head)
print("Data Tail:", data_tail)

# Sorting values by age
sorted_data_by_age = bank_data.sort_values(by='age', ascending= False).head()

#Grouping data by 'job' and computing mean for numeric columns
grouped_data_by_job = bank_data.groupby('job').mean(numeric_only=True).reset_index()

# Displaying the results
print("Sorted Data by Age:", sorted_data_by_age)
print("Grouped Data by Job:", grouped_data_by_job)
