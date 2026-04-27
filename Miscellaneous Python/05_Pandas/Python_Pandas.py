print("Hello World")

"""You can upload Excel datasets to your Colab environment using the file explorer on the left sidebar. Once uploaded, you can access the file using its path.

Here's an example of how to load an Excel file named `my_excel_dataset.xlsx` into a pandas DataFrame:
"""

import pandas as pd

# Replace 'my_excel_dataset.xlsx' with the actual name of your uploaded file
try:
  df = pd.read_excel('my_excel_dataset.xlsx')
  print("Excel dataset loaded successfully!")
  display(df.head())
except FileNotFoundError:
  print("Error: Make sure you have uploaded 'my_excel_dataset.xlsx' to your Colab environment.")
except Exception as e:
  print(f"An error occurred: {e}")

import pandas as pd
df = pd.read_excel('/content/lifeexpectancy-data-Data&Metadata.xls.xlsx')

print(type(df)) # type of the dataset

print(df.shape) # to know about the no. of rows and columns

print(df.columns)

print(df.dtypes) # to know about the data types

import pandas as pd
df = pd.read_excel('/content/lifeexpectancy-data-Data&Metadata.xls.xlsx')
df.head()

# @title Continent average used (see documentation)

from matplotlib import pyplot as plt
import seaborn as sns
df.groupby('Continent average used (see documentation)').size().plot(kind='barh', color=sns.palettes.mpl_palette('Dark2'))
plt.gca().spines[['top', 'right',]].set_visible(False)

print(df.info) #for the information about the dataset

print(df.head) # show rows from index 0 to 4, in python observation starts from 0,1,2,3,4....

print(df[10:15]) #show rows from index 10 to 15

print(df.tail)
