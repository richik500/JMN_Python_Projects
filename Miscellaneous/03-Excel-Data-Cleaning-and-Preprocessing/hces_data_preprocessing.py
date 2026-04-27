import pandas as pd
file_path = '/content/HCES_2023_24_Imputation_Rate.xlsx'
xls = pd.ExcelFile(file_path)

# Quick peek
print(df.head)
df.head(3)
print(df.isnull().sum())
df.dropna(how="all",inplace=True)

#  Numeric Columns
num_cols = ['sector','st','Questionnaire Item',
            'Rate_per_unit (Mode based)','Rate_per_unit (25th Percentile based)']

for col in num_cols:
  median = df[col].median()
  df[col].fillna(median, inplace=True)

# Categorical/Text Columns
df['Free Item Description'] = df['Free Item Description'].fillna('Unknown')
df['Item considered for rate computation'] = (
    df['Item considered for rate computation']
    .fillna(df['Item considered for rate computation'].mode()[0])
)

from sklearn.preprocessing import MinMaxScaler, StandardScaler

scalers = {
    'minmax': MinMaxScaler(),
    'zscore': StandardScaler()
}

scaled_frames = {}
for name, scaler in scalers.items():
  scaled = scaler.fit_transform(df[num_cols])
  scaled_frames[name] = pd.DataFrame(
      scaled, columns=[f"{c}_{name}" for c in num_cols]
      )

df=pd.concat([df, scaled_frames['minmax'], scaled_frames['zscore']],axis=1)
# e.g., df[['sector_minmax','sector_zscore]].head(2)

Q1 = df ['Rate_per_unit (Mode based)'].quantile(0.25)
Q3 = df ['Rate_per_unit (Mode based)'].quantile(0.75)
IQR = Q3 - Q1

lower,upper = Q1 - 1.5 * IQR, Q3 + 1.5*IQR
outliers = df [
    (df['Rate_per_unit (Mode based)']<lower) |
    (df['Rate_per_unit (Mode based)']>upper)
]
print(f"Outliers detected: {len(outliers)} rows")

#Check sheet names to understand the structure of the file
xls.sheet_names

# Load all sheets into separate dataframes for initial inspection
sheet_names = ['FDQ_Impu_rate_stsec',
 'FDQ_Impu_rate_sec',
 'DGQ_Impu_rate_stsec',
 'DGQ_Impu_rate_sec',
 'Annexure']
dfs = {sheet: pd.read_excel(file_path, sheet_name=sheet) for sheet in sheet_names}

# Display the first few rows of each dataframe to understand their structures
# Display the first few rows of each sheets and their data to understand the data
dfs_preview = {sheet: df.head() for sheet, df in dfs.items()}
dfs_preview

# Get the dataframe for the first sheet
df_sheet1 = dfs['FDQ_Impu_rate_stsec']

# Display the information and summary statistics
display(df_sheet1.info())
display(df_sheet1.describe())

# basic pandas commands
df = pd.read_excel(file_path, sheet_name='FDQ_Impu_rate_stsec', skiprows=1)
#1. Displaying the first 10 rows to inspect the data
head_df = df.head(10)

#2. Displaying basic statistical summaries for numerical columns
describe_df = df.describe(include='all')

#3. Checking data types and null values
info_df = df.info()

#4. Counting null values in each column
null_values_df = df.isnull().sum

#5. Displaying unique values in categorical columns
unique_sectors = df['sector'].unique()
unique_states = df['st'].unique()

head_df, describe_df, null_values_df, unique_sectors, unique_states

# Advanced pandas operation on the dataset

# 1. Grouping: Calculate mean Mode-based and 25th Percentile-based rates by sectors
grouped_sector = df.groupby('sector')[['Rate_per_unit (Mode based)','Rate_per_unit (25th Percentile Based)']]

# Pandas and Visualization Basic Commands Tutorial

import pandas as pd
import matplotlib.pyplot as plt

#load Dataset
df = pd.read_excel('/content/HCES_2023_24_Imputation_Rate.xlsx', sheet_names='FDQ_Impu_rate_stsec', skiprows=1)

#Basic data exploration

# Visualization
#1. historgram:
plt.figure(figsize=(8,5)) #The size is defined in Cm per pixel
df['Rate_per_unit (Mode based)']

"""We’ll work with HCES_2023_24_Imputation_Rate.xlsx, which contains state‑ and sector‑wise imputed rates for free‑of‑cost food items.
Key columns (after cleaning headers):
sector (numeric code)
st (state code)
Questionnaire Item (numeric ID of item)
Free Item Description (text)
Item considered for rate computation (categorical/list)
Rate_per_unit (Mode based) (numeric target)
Rate_per_unit (25th Percentile based) (numeric)


import pandas as pd
# Read Excel, skipping the title row (use row 1 as header)
file_path = '/content/HCES_2023_24_Imputation_Rate.xlsx'
df = pd.read_excel(file_path, header=1)

# Quick peek
print(df.shape)
df.head(3)

print(df.isnull().sum())

df.dropna(how='all', inplace=True)

# Numeric columns
num_cols = ['sector', 'st', 'Questionnaire Item',
            'Rate_per_unit (Mode based)',
            'Rate_per_unit (25th Percentile based)']

for col in num_cols:
    median = df[col].median()
    df[col].fillna(median, inplace=True)

# Categorical/Text columns
df['Free Item Description'] = df['Free Item Description'].fillna('Unknown')
df['Item considered for rate computation'] = (
    df['Item considered for rate computation']
      .fillna(df['Item considered for rate computation'].mode()[0])
)

from sklearn.preprocessing import MinMaxScaler, StandardScaler

scalers = {
    'minmax': MinMaxScaler(),
    'zscore': StandardScaler()
}

scaled_frames = {}
for name, scaler in scalers.items():
    scaled = scaler.fit_transform(df[num_cols])
    scaled_frames[name] = pd.DataFrame(
        scaled,
        columns=[f"{c}_{name}" for c in num_cols]
    )

df = pd.concat([df, scaled_frames['minmax'], scaled_frames['zscore']], axis=1)
# e.g., df[['sector_minmax','sector_zscore']].head(2)

Q1 = df['Rate_per_unit (Mode based)'].quantile(0.25)
Q3 = df['Rate_per_unit (Mode based)'].quantile(0.75)
IQR = Q3 - Q1

lower, upper = Q1 - 1.5*IQR, Q3 + 1.5*IQR
outliers = df[
    (df['Rate_per_unit (Mode based)'] < lower) |
    (df['Rate_per_unit (Mode based)'] > upper)
]
print(f"Outliers detected: {len(outliers)} rows")

df['Rate_mode_capped'] = df['Rate_per_unit (Mode based)'].clip(lower, upper)

from sklearn.model_selection import train_test_split
from sklearn.linear_model import LinearRegression
from sklearn.metrics import r2_score, mean_squared_error

# Features & target
X = df[['sector','st','Questionnaire Item']]
y = df['Rate_per_unit (Mode based)']

# Split
X_train, X_test, y_train, y_test = train_test_split(
    X, y, test_size=0.2, random_state=42
)

# Fit linear model
model = LinearRegression()
model.fit(X_train, y_train)

# Predict & evaluate
y_pred = model.predict(X_test)
print("R² score:        ", r2_score(y_test, y_pred))
print("RMSE:            ", mean_squared_error(y_test, y_pred))

# Examine coefficients
coeff_df = pd.DataFrame({
    'feature': X.columns,
    'coefficient': model.coef_
})
print(coeff_df)
