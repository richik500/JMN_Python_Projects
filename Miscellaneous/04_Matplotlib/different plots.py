import pandas as pd

#Load the dataset
df = pd.read_csv('/content/tips.csv')

#View first 10 rows
print(df.head(10))

import seaborn as sns
import matplotlib.pyplot as plt

# plot pairplot for all numerical variables, color by 'sex'
sns.pairplot(df, hue='sex')
plt.show()

plt.figure(figsize=(8,6))
sns.heatmap(df.corr(numeric_only=True), annot=True, cmap='coolwarm')
plt.title('Correlation Heatmap')
plt.show()



# Calculate the correlation matrix for all numerical variables
correlation_matrix = df.corr(numeric_only=True)

# Display the correlation matrix
print("Correlation Matrix:")
print(correlation_matrix)

# Interpretation of correlation values:
print("\nInterpretation:")
print("- Values close to 1 or -1 indicate a strong linear relationship.")
print("- Values close to 0 indicate a weak linear relationship.")
print("- Positive values indicate a positive linear relationship (as one variable increases, the other tends to increase).")
print("- Negative values indicate a negative linear relationship (as one variable increases, the other tends to decrease).")
print("\nGenerally:")
print("- |r| > 0.7: High correlation")
print("- 0.3 < |r| <= 0.7: Moderate correlation")
print("- |r| <= 0.3: Low correlation")

plt.figure(figsize=(8,6))
sns.boxplot(x='day',y='total_bill',hue='sex',data=df)
plt.title('Boxplot of Total Bill by Day and Sex')
plt.show()

plt.figure(figsize=(8,6))
sns.violinplot(x='day',y='total_bill',hue='sex',data=df)
plt.title('Violin Plot of Total Bill by Day and Sex')
plt.show()

plt.figure(figsize=(8,6))
sns.violinplot(x='time',y='tip',hue='smoker',data=df,split=True)
plt.title('Tip Distribution by Time and Smoker')
plt.show()

g = sns.FacetGrid(df,row='sex',col='smoker', margin_titles=True)
g.map_dataframe(sns.scatterplot,x='total_bill',y='tip',hue='day')
g.add_legend()
plt.show()
