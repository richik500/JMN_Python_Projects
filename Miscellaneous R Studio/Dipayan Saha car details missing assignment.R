library(mice)
library(VIM)
library(Hmisc)
# attaching the dataset
attach(car.details.v4_missing)

# Create a dataframe
df = df_raw = car.details.v4_missing

View(df)
is.na(df)
which(is.na(df))
sum(is.na(df))
summary(df)

# Price is the dependent variable and can't be imputed. Hence drop rows where Price is missing.
df = df[!is.na(df$Price), ]

# Now we will impute the missing values
# Kilometer → Median. Reason: Slightly skewed distribution (mean > median), so median is more robust to outliers.
df$Kilometer = gsub(",", "", df$Kilometer)  # remove commas
df$Kilometer = gsub(" km", "", df$Kilometer)  # remove ' km' if present
df$Kilometer = as.numeric(df$Kilometer)

sum(is.na(df$Kilometer))

df$Kilometer[is.na(df$Kilometer)] = median(df$Kilometer, na.rm = TRUE)

# Engine → Median. Reason: Engine size has strong outliers (luxury/SUV cars with very high cc). 
# Here We know Median reduces the effect of extreme values.
df$Engine[is.na(df$Engine)] = median(df$Engine, na.rm = TRUE)

# Length → Mean. Reason: Mean and median are almost the same (symmetric distribution).
# Here Mean is a good representation of central tendency.
df$Length[is.na(df$Length)] = mean(df$Length, na.rm = TRUE)

# Width → Mean. Reason: Distribution is nearly symmetric (mean ≈ median).
# Here Mean imputation is suitable here.
df$Width[is.na(df$Width)] = mean(df$Width, na.rm = TRUE)

# Height → Median. Reason: Slightly skewed distribution.
# Here Median is preferred to avoid influence of outliers.
df$Height[is.na(df$Height)] = median(df$Height, na.rm = TRUE)

# Seating Capacity → Mode. Reason: Seating capacity is more categorical (most cars are 5-seaters). 
# Mode ensures the most common realistic value is used.
mode_seating = as.numeric(names(sort(table(df$Seating.Capacity), decreasing = TRUE)[1]))
df$Seating.Capacity[is.na(df$Seating.Capacity)] = mode_seating

# Fuel Tank Capacity → Mean. Reason: Distribution is fairly symmetric (mean ≈ median). 
# Using mean avoids bias and keeps consistency with continuous variables.
df$Fuel.Tank.Capacity[is.na(df$Fuel.Tank.Capacity)] = mean(df$Fuel.Tank.Capacity, na.rm = TRUE)

# View the full updated dataset
View(df)
summary(df)

library(writexl)

# Save the cleaned dataset to Excel 
write_xlsx(df, "C:/Users/richi/Documents/3rd sem/MVA/cleaned_car_details_dipayansaha.xlsx")
