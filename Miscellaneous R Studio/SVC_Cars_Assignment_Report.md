# SVC Cars Assignment — Code Walkthrough & Rationale

_Generated on October 18, 2025_

This document explains **what each code block does** and **why** those choices were made. It's written to be pasted directly into a report.

---

## Code Cell 1

### Code

```python
# --- Step 1: Load the Dataset ---
import pandas as pd
df = pd.read_csv("/content/imports-85.csv")
```

### What this does

- Imports pandas for DataFrame-based data loading, cleaning, and manipulation.
- Loads data from a CSV file into a pandas DataFrame.

### Why we do it here

- Pandas provides tabular structures and high-level utilities ideal for preprocessing ML datasets.
- DataFrames offer convenient indexing and preprocessing for ML workflows.

---

## Code Cell 2

### Code

```python
df.info()
df.head(5)
```

### What this does

- Displays the first few rows of the dataset.
- Shows DataFrame info (dtypes, non-null counts).

### Why we do it here

- Quick sanity-check to verify loading and inspect columns.
- Helps detect missing values and type issues early.

---

## Code Cell 3

### Code

```python
# Create a copy of the original DataFrame
df_clean = df.copy()
```

### What this does

- Executes a specific step in the notebook workflow.

### Why we do it here

- Contributes to data preparation, modeling, or evaluation as part of the end-to-end pipeline.

---

## Code Cell 4

### Code

```python
df_clean.info()
df_clean.head()
```

### What this does

- Displays the first few rows of the dataset.
- Shows DataFrame info (dtypes, non-null counts).

### Why we do it here

- Quick sanity-check to verify loading and inspect columns.
- Helps detect missing values and type issues early.

---

## Code Cell 5

### Code

```python
# --- Step 2: Data Cleaning – Handling Missing and Invalid Price Values ---
import numpy as np
import pandas as pd

# Standardize missing values and convert 'price' to numeric
df_clean.replace('?', np.nan, inplace=True)
df_clean['price'] = pd.to_numeric(df_clean['price'], errors='coerce')

# Remove rows with missing 'price' values
print("\n--- Handling Missing 'price' Values ---")
initial_count = len(df_clean)
print(f"Initial rows: {initial_count}")

df_clean.dropna(subset=['price'], inplace=True)

# Display results and updated DataFrame info
final_count = len(df_clean)
print(f"Rows removed: {initial_count - final_count}")
print(f"Rows remaining: {final_count}\n")
print("Updated DataFrame Info:")
df_clean.info()
```

### What this does

- Imports NumPy for fast numerical arrays and vectorized math.
- Imports pandas for DataFrame-based data loading, cleaning, and manipulation.
- Shows DataFrame info (dtypes, non-null counts).

### Why we do it here

- NumPy underpins most scientific Python libraries and is efficient for numerical operations used in ML pipelines.
- Pandas provides tabular structures and high-level utilities ideal for preprocessing ML datasets.
- Helps detect missing values and type issues early.

---

## Code Cell 6

### Code

```python
# --- Step 3 : Analyze Missing Data ---
# Calculate the percentage of missing values for each column
missing_percentage = (df_clean.isnull().sum() / len(df_clean)) * 100

# Filter only the columns that have missing values and sort them in descending order
missing_percentage_sorted = missing_percentage[missing_percentage > 0].sort_values(ascending=False)

# Display the results
print("\n--- Percentage of Missing Values by Column ---")
print(missing_percentage_sorted)
```

### What this does

- Executes a specific step in the notebook workflow.

### Why we do it here

- Contributes to data preparation, modeling, or evaluation as part of the end-to-end pipeline.

---

## Code Cell 7

### Code

```python
# --- Step 4: Visualize Missing Data Pattern Using Heatmap ---

# Import required libraries
import pandas as pd
import seaborn as sns
import matplotlib.pyplot as plt

# Identify columns that contain missing values
cols_with_missing = df_clean.columns[df_clean.isnull().any()].tolist()
df_missing = df_clean[cols_with_missing]

# Display basic info
print(f"Number of columns with missing values: {len(cols_with_missing)}")
print("Columns containing missing data:")
print(cols_with_missing)

# --- Create a Heatmap for Missing Data ---
plt.figure(figsize=(12, 8))
sns.heatmap(
    df_missing.isnull(),
    cbar=False,
    cmap='plasma', # Changed colormap
    yticklabels=False  # Hides row labels for clarity
)

# Add descriptive titles and labels
plt.title('Missing Data Pattern (Columns with Missing Values)', fontsize=14, pad=15)
plt.xlabel('Features', fontsize=12)
plt.ylabel('Records', fontsize=12)
plt.tight_layout()

# Display the heatmap
plt.show()
```

### What this does

- Imports pandas for DataFrame-based data loading, cleaning, and manipulation.
- Imports Matplotlib for plotting.
- Imports Seaborn for statistical visualizations on top of Matplotlib.
- Creates visualizations with Seaborn.
- Plots a heatmap (often for the confusion matrix).

### Why we do it here

- Pandas provides tabular structures and high-level utilities ideal for preprocessing ML datasets.
- Visualizations help inspect data distributions, class balance, and model diagnostics.
- Seaborn provides cleaner defaults and quick statistical plots like pairplots and heatmaps.
- Plots such as countplots, boxplots, pairplots, or heatmaps aid data understanding.
- Visualizes misclassifications to spot systematic errors.

---

## Code Cell 8

### Code

```python
# --- Step 5: Remove Rows with Missing 'bore' or 'horsepower' Values ---

# Record the initial number of rows
initial_rows = len(df_clean)
print(f"Initial row count: {initial_rows}")

# Drop rows where either 'bore' or 'horsepower' has missing values
df_clean.dropna(subset=['bore', 'horsepower'], inplace=True)

# Calculate and display the number of rows removed
rows_removed = initial_rows - len(df_clean)
print(f"Rows removed (due to missing 'bore' or 'horsepower'): {rows_removed}")
print(f"Rows remaining after cleanup: {len(df_clean)}")

# Display updated DataFrame information
print("\nUpdated DataFrame Info:")
df_clean.info()
```

### What this does

- Shows DataFrame info (dtypes, non-null counts).

### Why we do it here

- Helps detect missing values and type issues early.

---

## Code Cell 9

### Code

```python
# --- Step 6: Verify Remaining Missing Values ---

# Calculate the percentage of missing values in each column
missing_percentage = (df_clean.isnull().sum() / len(df_clean)) * 100
missing_percentage = missing_percentage[missing_percentage > 0].sort_values(ascending=False)

# Display results
if missing_percentage.empty:
    print("\nNo missing values remain in the dataset.")
else:
    print("\nColumns still containing missing values:")
    print(missing_percentage)
```

### What this does

- Executes a specific step in the notebook workflow.

### Why we do it here

- Contributes to data preparation, modeling, or evaluation as part of the end-to-end pipeline.

---

## Code Cell 10

### Code

```python
df_clean.head(3)
```

### What this does

- Displays the first few rows of the dataset.

### Why we do it here

- Quick sanity-check to verify loading and inspect columns.

---

## Code Cell 11

### Code

```python
# --- Step 7: Analyze the Distribution of 'num-of-doors' ---

# Calculate the frequency of each unique category
door_counts = df_clean['num-of-doors'].value_counts()

# Calculate the percentage distribution (excluding missing values)
door_percentage = (door_counts / df_clean['num-of-doors'].count()) * 100

# Display results
print("\n--- Frequency Distribution of 'num-of-doors' ---")
print(door_counts)

print("\n--- Percentage Distribution of 'num-of-doors' ---")
print(door_percentage.round(2).astype(str) + '%')
```

### What this does

- Executes a specific step in the notebook workflow.

### Why we do it here

- Contributes to data preparation, modeling, or evaluation as part of the end-to-end pipeline.

---

## Code Cell 12

### Code

```python
# --- Step 8: KNN Imputation for 'num-of-doors ---'

# This step performs K-Nearest Neighbors (KNN) imputation to fill missing values
# in the 'num-of-doors' column using all numeric features in the dataset.

# --- Import required libraries ---
import pandas as pd
import numpy as np
from sklearn.impute import KNNImputer

# --- Step 8.1: Prepare the 'num-of-doors' column ---
# Convert string values ('two', 'four') to numeric values (2, 4)
door_mapping = {'two': 2, 'four': 4}
df_clean['num-of-doors'] = df_clean['num-of-doors'].replace(door_mapping)

# Identify all numeric columns to be used as features for KNN imputation
numeric_cols = df_clean.select_dtypes(include=np.number).columns.tolist()
df_impute = df_clean[numeric_cols].copy()

# --- Step 8.2: Apply KNN Imputer ---
k_value = 5  # Number of neighbors for KNN
imputer = KNNImputer(n_neighbors=k_value)

# Fit the imputer and transform the numeric DataFrame
df_impute_filled = imputer.fit_transform(df_impute)

# Convert the NumPy array back to a DataFrame with the original column names
df_impute_filled = pd.DataFrame(df_impute_filled, columns=numeric_cols, index=df_clean.index)

# --- Step 8.3: Update the 'num-of-doors' column ---
# Round the imputed values to the nearest integer (2 or 4)
df_clean['num-of-doors'] = df_impute_filled['num-of-doors'].round().astype(int)

# --- Step 8.4: Verify the imputation ---
print("Imputation of 'num-of-doors' complete.")
print("\nFinal unique values in 'num-of-doors':", df_clean['num-of-doors'].unique())
print("Missing values remaining:", df_clean['num-of-doors'].isnull().sum())
```

### What this does

- Imports NumPy for fast numerical arrays and vectorized math.
- Imports pandas for DataFrame-based data loading, cleaning, and manipulation.
- Imports scikit-learn utilities (models, preprocessing, model selection, metrics).

### Why we do it here

- NumPy underpins most scientific Python libraries and is efficient for numerical operations used in ML pipelines.
- Pandas provides tabular structures and high-level utilities ideal for preprocessing ML datasets.
- scikit-learn is a standard ML toolkit in Python for training, validation, and evaluation.

---

## Code Cell 13

### Code

```python
# --- Step 9: Count and Percentage of 'num-of-doors' Categories ---

# Calculate the count of each unique category in 'num-of-doors'
category_counts = df_clean['num-of-doors'].value_counts()

# Calculate the percentage of each category (excluding missing values)
category_percentage = (category_counts / df_clean['num-of-doors'].count()) * 100

# Display the counts
print("--- Counts for 'num-of-doors' ---")
print(category_counts)

# Display the percentage distribution (rounded to 2 decimals with '%' symbol)
print("\n--- Percentage Distribution for 'num-of-doors' ---")
print(category_percentage.round(2).astype(str) + '%')
```

### What this does

- Executes a specific step in the notebook workflow.

### Why we do it here

- Contributes to data preparation, modeling, or evaluation as part of the end-to-end pipeline.

---

## Code Cell 14

### Code

```python
# --- Step 10: Enforce Valid Values in 'num-of-doors' ---

# Calculate the mode (most frequent value) among valid door counts (2 and 4)
# .mode()[0] returns the first mode, which is the most common value
door_mode = df_clean['num-of-doors'].mode()[0]

# Replace any invalid value (e.g., 3) with the calculated mode
df_clean['num-of-doors'].replace({3: door_mode}, inplace=True)

# Display the updated counts after enforcing valid constraints
print("--- Category Counts After Constraint Enforcement ---")
print(df_clean['num-of-doors'].value_counts())
```

### What this does

- Executes a specific step in the notebook workflow.

### Why we do it here

- Contributes to data preparation, modeling, or evaluation as part of the end-to-end pipeline.

---

## Code Cell 15

### Code

```python
# --- Step 11: Display Updated DataFrame Information ---

print("\n--- Updated DataFrame Overview ---")
df_clean.info()
```

### What this does

- Shows DataFrame info (dtypes, non-null counts).

### Why we do it here

- Helps detect missing values and type issues early.

---

## Code Cell 16

### Code

```python
# --- Step 12: Descriptive Statistics for 'normalized-losses' ---

# Calculate mean and standard deviation (ignoring NaN values automatically)
losses_mean = df_clean['normalized-losses'].mean()
losses_std = df_clean['normalized-losses'].std()

# Display the results
print("--- Descriptive Statistics for 'normalized-losses' ---")
print(f"Mean: {losses_mean:.2f}")
print(f"Standard Deviation: {losses_std:.2f}")
```

### What this does

- Executes a specific step in the notebook workflow.

### Why we do it here

- Contributes to data preparation, modeling, or evaluation as part of the end-to-end pipeline.

---

## Code Cell 17

### Code

```python
# --- Step 13: Visualizing 'normalized-losses' ---

import matplotlib.pyplot as plt
import seaborn as sns

# Set up the figure size for two plots side-by-side
fig, axes = plt.subplots(1, 2, figsize=(14, 5))

# --- Plot 1: Histogram with KDE ---
sns.histplot(
    df_clean['normalized-losses'],
    kde=True,
    color='skyblue',    # Custom color for histogram
    edgecolor='black',  # Black edges for clarity
    ax=axes[0]
)
axes[0].set_title('Histogram of Normalized Losses (with KDE)', fontsize=12)
axes[0].set_xlabel('Normalized Losses')
axes[0].set_ylabel('Frequency')

# --- Plot 2: Box Plot ---
sns.boxplot(
    y=df_clean['normalized-losses'],
    color='lightgreen',  # Custom color for boxplot
    ax=axes[1]
)
axes[1].set_title('Box Plot of Normalized Losses', fontsize=12)
axes[1].set_ylabel('Normalized Losses')

# Adjust layout to prevent overlap
plt.tight_layout()
plt.show()
```

### What this does

- Imports Matplotlib for plotting.
- Imports Seaborn for statistical visualizations on top of Matplotlib.
- Creates visualizations with Seaborn.

### Why we do it here

- Visualizations help inspect data distributions, class balance, and model diagnostics.
- Seaborn provides cleaner defaults and quick statistical plots like pairplots and heatmaps.
- Plots such as countplots, boxplots, pairplots, or heatmaps aid data understanding.

---

## Code Cell 18

### Code

```python
# --- Step 14: Removing Specific Outliers in 'normalized-losses' ---

# Store the initial number of rows for reference
initial_rows = len(df_clean)
print(f"Initial number of rows: {initial_rows}")

# Define the indices of rows identified as outliers
outlier_indices = [190, 106]

# Filter out indices that are not present in the current DataFrame index
indices_to_drop = [index for index in outlier_indices if index in df_clean.index]

# Drop the specified outlier rows from the DataFrame
if indices_to_drop:
    df_clean.drop(index=indices_to_drop, inplace=True)
    # Calculate and print the number of rows removed
    rows_dropped = initial_rows - len(df_clean)
    print(f"Number of rows dropped: {rows_dropped}")
    print(f"Final number of rows: {len(df_clean)}")

    # Verify the outliers are removed by checking the top 3 'normalized-losses' values
    print("\nTop 3 'normalized-losses' values after outlier removal:")
    print(df_clean['normalized-losses'].sort_values(ascending=False).head(3))
else:
    print("None of the specified outlier indices were found in the DataFrame.")
    print(f"Final number of rows: {len(df_clean)}")
```

### What this does

- Displays the first few rows of the dataset.

### Why we do it here

- Quick sanity-check to verify loading and inspect columns.

---

## Code Cell 19

### Code

```python
# --- Step 15: Correlation Matrix Heatmap ---

import matplotlib.pyplot as plt
import seaborn as sns
import numpy as np

# Select all numeric columns for correlation analysis
df_numeric = df_clean.select_dtypes(include=np.number)

# Calculate the correlation matrix
correlation_matrix = df_numeric.corr()

# Set up the figure size
plt.figure(figsize=(16, 14))

# Draw the heatmap
sns.heatmap(
    correlation_matrix,
    annot=True,               # Show correlation values on the heatmap
    cmap='RdBu_r',            # Diverging palette: red for negative, blue for positive
    center=0,                 # Center the colormap at 0
    linewidths=0.8,           # Line width between cells
    linecolor='white',        # Color of the lines
    cbar_kws={'shrink': 0.8, 'label': 'Correlation Coefficient'}  # Colorbar customization
)

# Add title
plt.title('Correlation Matrix Heatmap of Numeric Features', fontsize=18)
plt.xticks(rotation=45)       # Rotate x-axis labels for readability
plt.yticks(rotation=0)        # Keep y-axis labels horizontal
plt.tight_layout()
plt.show()
```

### What this does

- Imports NumPy for fast numerical arrays and vectorized math.
- Imports Matplotlib for plotting.
- Imports Seaborn for statistical visualizations on top of Matplotlib.
- Creates visualizations with Seaborn.
- Plots a heatmap (often for the confusion matrix).

### Why we do it here

- NumPy underpins most scientific Python libraries and is efficient for numerical operations used in ML pipelines.
- Visualizations help inspect data distributions, class balance, and model diagnostics.
- Seaborn provides cleaner defaults and quick statistical plots like pairplots and heatmaps.
- Plots such as countplots, boxplots, pairplots, or heatmaps aid data understanding.
- Visualizes misclassifications to spot systematic errors.

---

## Code Cell 20

### Code

```python
# --- Step 16: Pairwise Correlation Analysis ---

# Correlation between 'symboling' (risk rating) and 'normalized-losses'
corr_symboling_losses = df_clean['symboling'].corr(df_clean['normalized-losses'])
print("--- Correlation between 'symboling' and 'normalized-losses' ---")
print(f"Correlation Coefficient (r): {corr_symboling_losses:.2f}\n")

# Correlation between 'normalized-losses' and 'height'
corr_losses_height = df_clean['normalized-losses'].corr(df_clean['height'])
print("--- Correlation between 'normalized-losses' and 'height' ---")
print(f"Correlation Coefficient (r): {corr_losses_height:.2f}")
```

### What this does

- Executes a specific step in the notebook workflow.

### Why we do it here

- Contributes to data preparation, modeling, or evaluation as part of the end-to-end pipeline.

---

## Code Cell 21

### Code

```python
# --- Step 17: Impute Missing 'normalized-losses' Using Linear Regression ---

from sklearn.linear_model import LinearRegression
import pandas as pd

# Split the data into rows with known and missing 'normalized-losses'
df_train = df_clean.dropna(subset=['normalized-losses'])
df_predict = df_clean[df_clean['normalized-losses'].isnull()]

missing_count = len(df_predict)
print(f"Number of 'normalized-losses' values to impute: {missing_count}")

if missing_count > 0:
    # Define features and target
    X_train = df_train[['symboling', 'height']]
    y_train = df_train['normalized-losses']
    X_predict = df_predict[['symboling', 'height']]

    # Train Linear Regression model
    lr_imputer = LinearRegression()
    lr_imputer.fit(X_train, y_train)

    # Predict missing values and update the DataFrame
    df_clean.loc[df_clean['normalized-losses'].isnull(), 'normalized-losses'] = lr_imputer.predict(X_predict)

    # Verify imputation
    remaining_nan = df_clean['normalized-losses'].isnull().sum()
    print(f"Imputation successful. Remaining NaN count: {remaining_nan}")
else:
    print("No missing 'normalized-losses' values found. Imputation skipped.")

# Final DataFrame overview
df_clean.info()
```

### What this does

- Imports pandas for DataFrame-based data loading, cleaning, and manipulation.
- Imports scikit-learn utilities (models, preprocessing, model selection, metrics).
- Shows DataFrame info (dtypes, non-null counts).
- Generates predictions on new data (validation or test set).

### Why we do it here

- Pandas provides tabular structures and high-level utilities ideal for preprocessing ML datasets.
- scikit-learn is a standard ML toolkit in Python for training, validation, and evaluation.
- Helps detect missing values and type issues early.
- Predictions are needed to compute performance metrics.

---

## Code Cell 22

### Code

```python
# --- Step 18: Updated Descriptive Statistics for 'normalized-losses' ---

# Calculate mean and standard deviation (NaN values are ignored automatically)
losses_mean = df_clean['normalized-losses'].mean()
losses_std = df_clean['normalized-losses'].std()

# Display the updated statistics
print("--- Updated Descriptive Statistics for 'normalized-losses' ---")
print(f"Mean: {losses_mean:.2f}")
print(f"Standard Deviation: {losses_std:.2f}")
```

### What this does

- Executes a specific step in the notebook workflow.

### Why we do it here

- Contributes to data preparation, modeling, or evaluation as part of the end-to-end pipeline.

---

## Code Cell 23

### Code

```python
# --- Step 19: Box Plots for Outlier Detection in All Numeric Features ---

import matplotlib.pyplot as plt
import seaborn as sns
import numpy as np

# Select all numerical columns
df_numeric = df_clean.select_dtypes(include=np.number)

# Determine the number of plots needed
n_cols = df_numeric.shape[1]
n_rows = (n_cols + 2) // 3  # 3 plots per row

# Set up the figure and axes for subplots
fig, axes = plt.subplots(n_rows, 3, figsize=(18, 5 * n_rows))
axes = axes.flatten()  # Flatten for easy iteration

# Create a box plot for each numeric column
for i, col in enumerate(df_numeric.columns):
    sns.boxplot(y=df_numeric[col], ax=axes[i], color='red')
    axes[i].set_title(f'Outlier Check: {col}', fontsize=12)
    axes[i].set_ylabel(col)

# Remove any unused subplots
for j in range(n_cols, len(axes)):
    fig.delaxes(axes[j])

# Adjust layout and display
plt.tight_layout()
plt.show()
```

### What this does

- Imports NumPy for fast numerical arrays and vectorized math.
- Imports Matplotlib for plotting.
- Imports Seaborn for statistical visualizations on top of Matplotlib.
- Creates visualizations with Seaborn.

### Why we do it here

- NumPy underpins most scientific Python libraries and is efficient for numerical operations used in ML pipelines.
- Visualizations help inspect data distributions, class balance, and model diagnostics.
- Seaborn provides cleaner defaults and quick statistical plots like pairplots and heatmaps.
- Plots such as countplots, boxplots, pairplots, or heatmaps aid data understanding.

---

## Code Cell 24

### Code

```python
# --- Step 20: Correlation of All Numeric Features with 'price' ---

import numpy as np

# Select all numeric columns
df_numeric = df_clean.select_dtypes(include=np.number)

# Calculate correlation of all numeric columns with 'price'
correlation_with_price = df_numeric.corr()['price'].sort_values(ascending=False)

# Sort by absolute correlation to see the strongest relationships, ignoring direction
strongest_correlations = correlation_with_price.iloc[1:].abs().sort_values(ascending=False)
strongest_correlations = correlation_with_price.loc[strongest_correlations.index]

# Display the results rounded to 2 decimal places
print("--- Correlation of All Features with 'price' (Sorted by Strength) ---")
print(strongest_correlations.round(2))
```

### What this does

- Imports NumPy for fast numerical arrays and vectorized math.

### Why we do it here

- NumPy underpins most scientific Python libraries and is efficient for numerical operations used in ML pipelines.

---

## Code Cell 25

### Code

```python
# --- Step 21: One-Hot Encoding of Categorical Variables ---
# ================================

import pandas as pd

# Identify all categorical columns (object dtype)
categorical_cols = df_clean.select_dtypes(include=['object']).columns
print(f"Categorical columns to be one-hot encoded: {categorical_cols.tolist()}")

# Apply One-Hot Encoding
# drop_first=True avoids the dummy variable trap (removes one category per feature)
df_clean = pd.get_dummies(df_clean, columns=categorical_cols, drop_first=True)

# Verify the transformation
print(f"\nDataFrame shape after One-Hot Encoding: {df_clean.shape}")
df_clean.info()
```

### What this does

- Imports pandas for DataFrame-based data loading, cleaning, and manipulation.
- Shows DataFrame info (dtypes, non-null counts).
- Applies one-hot encoding for categorical variables.

### Why we do it here

- Pandas provides tabular structures and high-level utilities ideal for preprocessing ML datasets.
- Helps detect missing values and type issues early.
- SVC requires numeric input; one-hot encoding creates binary indicator columns per category.

---

## Code Cell 26

### Code

```python
# --- Step 22: One-Hot Encoding for 'num-of-doors' ---

import pandas as pd

# Ensure 'num-of-doors' is treated as a categorical variable
df_clean['num-of-doors'] = df_clean['num-of-doors'].astype('object')

# Apply One-Hot Encoding to 'num-of-doors' only
# drop_first=True avoids the Dummy Variable Trap
df_clean = pd.get_dummies(df_clean, columns=['num-of-doors'], drop_first=True)

# Verify the new columns created after encoding
print("--- New Columns After Encoding 'num-of-doors' ---")
print(df_clean.filter(like='num-of-doors_').head())

# Display the updated DataFrame shape
print(f"\nDataFrame shape after 'num-of-doors' encoding: {df_clean.shape}")
```

### What this does

- Imports pandas for DataFrame-based data loading, cleaning, and manipulation.
- Displays the first few rows of the dataset.
- Applies one-hot encoding for categorical variables.

### Why we do it here

- Pandas provides tabular structures and high-level utilities ideal for preprocessing ML datasets.
- Quick sanity-check to verify loading and inspect columns.
- SVC requires numeric input; one-hot encoding creates binary indicator columns per category.

---

## Code Cell 27

### Code

```python
df_clean.head(3)
```

### What this does

- Displays the first few rows of the dataset.

### Why we do it here

- Quick sanity-check to verify loading and inspect columns.

---

## Code Cell 28

### Code

```python
# --- Step 23: Final Correlation of All Features with 'price' ---

import numpy as np

# Since all categorical columns are encoded, the DataFrame is fully numeric
correlation_with_price = df_clean.corr()['price']

# Sort features by absolute correlation to identify strongest predictors
strongest_correlations = correlation_with_price.iloc[1:].abs().sort_values(ascending=False)
strongest_correlations = correlation_with_price.loc[strongest_correlations.index]

# Display the sorted correlations rounded to 2 decimal places
print("--- Final Correlation of All Features with 'price' (Sorted by Strength) ---")
print(strongest_correlations.round(3))
```

### What this does

- Imports NumPy for fast numerical arrays and vectorized math.

### Why we do it here

- NumPy underpins most scientific Python libraries and is efficient for numerical operations used in ML pipelines.

---

## Code Cell 29

### Code

```python
# --- Step 24: Drop Low-Correlation Features ---

import numpy as np

# Calculate correlation of all features with 'price'
correlation_with_price = df_clean.corr()['price']

# Identify features with absolute correlation < 0.3 (excluding 'price')
columns_to_drop = correlation_with_price[
    (correlation_with_price.abs() < 0.3) & (correlation_with_price.index != 'price')
].index.tolist()

# Display dropped columns and initial column count
print("--- Columns Dropped (|Correlation| < 0.3) ---")
print(columns_to_drop)
print(f"\nInitial number of columns: {df_clean.shape[1] + len(columns_to_drop)}")

# Drop the identified low-correlation features
df_clean.drop(columns=columns_to_drop, inplace=True)

# Display updated DataFrame info
print(f"\nFinal number of columns: {df_clean.shape[1]}")
print("\nUpdated DataFrame Info:")
df_clean.info()
```

### What this does

- Imports NumPy for fast numerical arrays and vectorized math.
- Shows DataFrame info (dtypes, non-null counts).

### Why we do it here

- NumPy underpins most scientific Python libraries and is efficient for numerical operations used in ML pipelines.
- Helps detect missing values and type issues early.

---

## Code Cell 30

### Code

```python
# --- Step 25: Final Correlation of Features with 'price' ---

import numpy as np

# Since all categorical columns are encoded, the DataFrame is fully numeric
correlation_with_price = df_clean.corr()['price']

# Sort features by absolute correlation (excluding 'price') to identify strongest predictors
strongest_correlations = correlation_with_price.drop('price').abs().sort_values(ascending=False)
strongest_correlations = correlation_with_price.loc[strongest_correlations.index]

# Display the sorted correlations rounded to 2 decimal places
print("--- Final Correlation of All Features with 'price' (Sorted by Strength) ---")
print(strongest_correlations.round(2))
```

### What this does

- Imports NumPy for fast numerical arrays and vectorized math.

### Why we do it here

- NumPy underpins most scientific Python libraries and is efficient for numerical operations used in ML pipelines.

---

## Code Cell 31

### Code

```python
# --- Step 26: Box Plots for Outlier Detection in Final Features ---

import matplotlib.pyplot as plt
import seaborn as sns
import numpy as np

# Select all numeric columns in the final trimmed DataFrame
df_numeric_final = df_clean.select_dtypes(include=np.number)

# Determine the layout for subplots (4 plots per row)
n_cols = df_numeric_final.shape[1]
n_rows = (n_cols + 3) // 4  # Ceiling division

# Set up the figure and axes
fig, axes = plt.subplots(n_rows, 4, figsize=(18, 4 * n_rows))
axes = axes.flatten()  # Flatten for easy iteration

# Create a box plot for each numerical column
for i, col in enumerate(df_numeric_final.columns):
    sns.boxplot(y=df_numeric_final[col], ax=axes[i], color='lightcoral')
    axes[i].set_title(col, fontsize=10)
    axes[i].set_ylabel('')  # Remove y-label for cleaner layout

# Remove any unused subplots
for j in range(n_cols, len(axes)):
    fig.delaxes(axes[j])

# Add a super title for the figure
plt.suptitle('Final Outlier Check for Selected Features', fontsize=16, y=1.02)
plt.tight_layout()
plt.show()
```

### What this does

- Imports NumPy for fast numerical arrays and vectorized math.
- Imports Matplotlib for plotting.
- Imports Seaborn for statistical visualizations on top of Matplotlib.
- Creates visualizations with Seaborn.

### Why we do it here

- NumPy underpins most scientific Python libraries and is efficient for numerical operations used in ML pipelines.
- Visualizations help inspect data distributions, class balance, and model diagnostics.
- Seaborn provides cleaner defaults and quick statistical plots like pairplots and heatmaps.
- Plots such as countplots, boxplots, pairplots, or heatmaps aid data understanding.

---

## Code Cell 32

### Code

```python
# --- Step 27: Descriptive Statistics for the Final 'price' Column ---

# Calculate mean and standard deviation (NaN values are automatically ignored)
price_mean = df_clean['price'].mean()
price_std = df_clean['price'].std()

# Display the results with formatted output
print("--- Descriptive Statistics for Final 'price' Column ---")
print(f"Mean Price: ${price_mean:,.2f}")
print(f"Standard Deviation (SD) of Price: ${price_std:,.2f}")
```

### What this does

- Executes a specific step in the notebook workflow.

### Why we do it here

- Contributes to data preparation, modeling, or evaluation as part of the end-to-end pipeline.

---

## Code Cell 33

### Code

```python
# --- Step 28: Train-Test Split (80% Train / 20% Test) ---

from sklearn.model_selection import train_test_split
import pandas as pd

# Separate features (X) and target variable (y)
X = df_clean.drop('price', axis=1)
y = df_clean['price']

# Perform the train-test split
# test_size=0.2 → 20% of data for testing
# random_state=42 → ensures reproducibility
X_train, X_test, y_train, y_test = train_test_split(
    X, y, test_size=0.2, random_state=42
)

# Verify the split
print("--- Data Split Verification ---")
print(f"Total number of rows: {len(df_clean)}")
print(f"X_train shape (Training Features): {X_train.shape}")
print(f"X_test shape (Testing Features): {X_test.shape}")
print(f"y_train shape (Training Target): {y_train.shape}")
print(f"y_test shape (Testing Target): {y_test.shape}")
```

### What this does

- Imports pandas for DataFrame-based data loading, cleaning, and manipulation.
- Imports scikit-learn utilities (models, preprocessing, model selection, metrics).
- Imports train_test_split to split dataset into training and testing sets.
- Splits data into training and test subsets.
- Sets a random_state for reproducibility.
- Specifies the proportion (or count) for the test set size.

### Why we do it here

- Pandas provides tabular structures and high-level utilities ideal for preprocessing ML datasets.
- scikit-learn is a standard ML toolkit in Python for training, validation, and evaluation.
- A hold-out test set provides an unbiased estimate of generalization performance.
- Training set is used for learning; test set evaluates generalization on unseen data.
- Ensures the same split and results can be replicated.
- Common splits like 20–30% balance evaluation reliability and training data quantity.

---

## Code Cell 34

### Code

```python
# --- Step 29: Feature Scaling and PCA Transformation (3 Components) ---

from sklearn.preprocessing import StandardScaler
from sklearn.decomposition import PCA
import pandas as pd

# Feature Scaling
scaler = StandardScaler()
# Fit on training data and transform both training and testing sets
X_train_scaled = scaler.fit_transform(X_train)
X_test_scaled = scaler.transform(X_test)  # Use the same scaler

# PCA Transformation (reduce to 3 components)
pca = PCA(n_components=3)
pca.fit(X_train_scaled)  # Fit PCA on scaled training data

# Transform both training and testing data
X_train_pca = pca.transform(X_train_scaled)
X_test_pca = pca.transform(X_test_scaled)

# Verification of PCA results
print("--- PCA Transformation Verification ---")
print(f"Original Feature Count: {X_train.shape[1]}")
print(f"PCA Components Count: {pca.n_components_}")
print(f"X_train_pca shape: {X_train_pca.shape}")
print(f"X_test_pca shape: {X_test_pca.shape}")
```

### What this does

- Imports pandas for DataFrame-based data loading, cleaning, and manipulation.
- Imports scikit-learn utilities (models, preprocessing, model selection, metrics).
- Imports StandardScaler to standardize features to zero mean and unit variance.
- Initializes a StandardScaler transformer.

### Why we do it here

- Pandas provides tabular structures and high-level utilities ideal for preprocessing ML datasets.
- scikit-learn is a standard ML toolkit in Python for training, validation, and evaluation.
- SVMs are sensitive to feature scales; standardization improves convergence and performance.
- Brings features to comparable scales; vital for SVM’s margin-based optimization.

---

## Code Cell 35

### Code

```python
# --- Step 30: Train Linear Regression on PCA-Transformed Features ---

from sklearn.linear_model import LinearRegression
import numpy as np

# Instantiate the Linear Regression Model
linear_model = LinearRegression()

# Train the model using the PCA-transformed training data
# Note: X_train_pca has 3 components
linear_model.fit(X_train_pca, y_train)

# Make predictions on both training and testing sets
y_train_pred = linear_model.predict(X_train_pca)
y_test_pred = linear_model.predict(X_test_pca)

# Display model details
print("--- Linear Regression Model Trained ---")

# Intercept
print("\nModel Intercept (Baseline Price):")
print(f"${linear_model.intercept_:.2f}")

# Coefficients for the 3 PCA components
print("\nCoefficients for the 3 PCA Components:")
for i, coef in enumerate(linear_model.coef_):
    print(f" Component {i+1}: {coef:,.2f}")

# Predictions (y_train_pred and y_test_pred) are now available for evaluation
```

### What this does

- Imports NumPy for fast numerical arrays and vectorized math.
- Imports scikit-learn utilities (models, preprocessing, model selection, metrics).
- Generates predictions on new data (validation or test set).

### Why we do it here

- NumPy underpins most scientific Python libraries and is efficient for numerical operations used in ML pipelines.
- scikit-learn is a standard ML toolkit in Python for training, validation, and evaluation.
- Predictions are needed to compute performance metrics.

---

## Code Cell 36

### Code

```python
# --- Step 31: Evaluate Linear Regression Model (R² and Adjusted R²) ---

from sklearn.metrics import r2_score
import numpy as np

# Calculate R-squared (R²) for the test set
r_squared = r2_score(y_test, y_test_pred)

# Define parameters for Adjusted R²
n = X_test_pca.shape[0]  # Number of observations in the test set
k = X_test_pca.shape[1]  # Number of predictors (PCA components = 3)

# alculate Adjusted R-squared
adjusted_r_squared = 1 - (1 - r_squared) * (n - 1) / (n - k - 1)

# Display performance metrics
print("--- Model Performance Metrics (Test Set) ---")
print(f"Standard R-squared (R²): {r_squared:.4f}")
print(f"Adjusted R-squared (Adjusted R²): {adjusted_r_squared:.4f}")
```

### What this does

- Imports NumPy for fast numerical arrays and vectorized math.
- Imports scikit-learn utilities (models, preprocessing, model selection, metrics).

### Why we do it here

- NumPy underpins most scientific Python libraries and is efficient for numerical operations used in ML pipelines.
- scikit-learn is a standard ML toolkit in Python for training, validation, and evaluation.

---

## Code Cell 37

### Code

```python
# --- Step 32: Predict Price for a New Car ---

import pandas as pd
import numpy as np

# Define raw data for the new car
# Only include features present in the final processed dataset
new_car_raw_data = {
    'wheel-base': 87.65,
    'length': 170.4,
    'width': 70,
    'height': 59.7,
    'curb-weight': 2300,
    'engine-size': 96,
    'bore': 3.00,
    'stroke': 3.25,
    'compression-ratio': 9.0,
    'horsepower': 70.0,
    'peak-rpm': 5200.0,
    'symboling': 2,              # Risk rating
    'normalized-losses': 160.0,  # Imputed value
    'make': 'bmw',             # Categorical
    'fuel-type': 'gas',           # Categorical
    'aspiration': 'turbo',          # Categorical
    'num-of-doors': 4,            # Categorical
    'body-style': 'sedan',        # Categorical
    'drive-wheels': 'fwd',        # Categorical
    'engine-location': 'front',   # Categorical
    'engine-type': 'dohc',         # Categorical
    'num-of-cylinders': 'four',   # Categorical
    'fuel-system': 'mpfi'         # Categorical
}

# Convert raw data into a single-row DataFrame
df_new_raw = pd.DataFrame([new_car_raw_data])

# Apply One-Hot Encoding (drop_first=True) to match training data
df_new_encoded = pd.get_dummies(df_new_raw, drop_first=True)

# Align the new car features with the training features
# Any missing dummy columns are filled with 0
X_new_car_final = df_new_encoded.reindex(columns=X_train.columns, fill_value=0)

# Scale the features using the fitted StandardScaler
X_new_scaled = scaler.transform(X_new_car_final)

# Apply PCA transformation using the fitted PCA object (3 components)
X_new_pca = pca.transform(X_new_scaled)

# Predict the price using the trained Linear Regression model
predicted_price = linear_model.predict(X_new_pca)

# Display the predicted price
print("\n--- Final Predicted Price ---")
print(f"The predicted market price for the new BMW Sedan is: ${predicted_price[0]:,.2f}")
```

### What this does

- Imports NumPy for fast numerical arrays and vectorized math.
- Imports pandas for DataFrame-based data loading, cleaning, and manipulation.
- Generates predictions on new data (validation or test set).
- Applies one-hot encoding for categorical variables.

### Why we do it here

- NumPy underpins most scientific Python libraries and is efficient for numerical operations used in ML pipelines.
- Pandas provides tabular structures and high-level utilities ideal for preprocessing ML datasets.
- Predictions are needed to compute performance metrics.
- SVC requires numeric input; one-hot encoding creates binary indicator columns per category.

---


## Appendix — SVC Best Practices (Context for the Report)

- **Scale features**: SVMs rely on distances; unscaled features distort margins. `StandardScaler` is typically used.
- **Tune hyperparameters**: 
  - `C` controls regularization (lower = wider margin, higher = fewer misclassifications on training data).
  - `kernel` sets the function space (e.g., `linear`, `rbf`, `poly`). `rbf` is a robust non-linear default.
  - `gamma` (for RBF/poly) controls influence of single points (higher gamma = tighter decision boundary, risk of overfit).
- **Use cross-validation**: Prefer `GridSearchCV` or `RandomizedSearchCV` to avoid optimistic estimates from a single split.
- **Avoid data leakage**: Wrap preprocessing and model in a `Pipeline`, so each CV fold fits transforms only on its training subset.
- **Class imbalance**: Consider `class_weight='balanced'` or resampling (SMOTE) when classes are skewed.
- **Report multiple metrics**: Accuracy, macro-averaged F1, and confusion matrix give a fuller picture, especially with imbalance.
- **Reproducibility**: Fix `random_state` on `train_test_split` and any stochastic steps.
