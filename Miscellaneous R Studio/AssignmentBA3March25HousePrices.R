#1
attach(house_prices)
library(ggplot2)
df=data.frame(house_prices)
ggplot(df, aes(x = SqFt, y = Price, color = Neighborhood)) +
  geom_point(alpha = 0.7)+
  labs(title = "Relationship between House Prices(₹) & Area(SqFt) for different neighborhoods",
       x = "Area (SqFt)",
       y = "Price (₹)") + theme_minimal()

ggplot(df, aes(x = SqFt, y = Price)) +
  geom_point() +
  geom_smooth(method = "lm", color = "blue") +
  labs(title = "Price (₹) vs. Area (SqFt)",
       x = "Area (SqFt)",
       y = "Price (₹)")
#1#2
ggplot(df, aes(x = Brick, y = Price)) +
  geom_boxplot(fill = "lightgreen") +
  labs(title = "Price Distribution by Brick Exterior",
       x = "Brick (Yes/No)",
       y = "Price (₹)")
#2#3
ggplot(df, aes(x = factor(Offers), y = Price)) +
  geom_boxplot(fill = "purple") +
  labs(title = "Price Distribution by Number of Offers",
       x = "Number of Offers",
       y = "Price (₹)")
#3#4
ggplot(df, aes(x = Neighborhood, y = Price, fill = Neighborhood)) + 
  geom_boxplot() + theme_minimal() + 
  labs(title = "Price Distribution by Neighborhood", x = "Neighborhood", y = "Price (In Rs.)") 
#4#5
ggplot(house_prices, aes(x = factor(Bedrooms), y = Price, fill = factor(Brick))) + geom_boxplot() + 
  theme_minimal() + 
  labs(title = "Price Distribution by No. of Bedrooms", x = "No. of Bedrooms", y = "Price (₹)") 
#5
house_prices$Price_per_SqFt <- (house_prices$Price / house_prices$SqFt) ggplot(house_prices, aes(x = 
                                                                                                   Price_per_SqFt)) + geom_histogram(bins = 20, fill = "orange", color = "black", alpha = 0.7) + theme_minimal() + labs(title = "Distribution of Price per SqFt", x = "Price per SqFt (In Rs.)", y = "Frequency")


mean_price_bath <- df %>% 
  group_by(Bathrooms) %>% 
  summarize(mean_price = mean(Price))
ggplot(mean_price_bath, aes(x = factor(Bathrooms), y = mean_price)) +
  geom_bar(stat = "identity", fill = "lightyellow") +
  labs(title = "Average Price by Number of Bathrooms",
       x = "Number of Bathrooms",
       y = "Average Price ($)")

#6
house_prices$Price_per_AreaSqFt <- (house_prices$Price / house_prices$SqFt)
ggplot(df, aes(x = Price_per_AreaSqFt)) + geom_histogram(bins = 20, fill = "green", color = "black", alpha = 0.6) + theme_minimal() + labs(title = "Distribution of Price(₹) per Area (SqFt)", x = "Price per SqFt (₹)", y = "Frequency")
#6


library(dplyr)
mean_price_bed <- df %>% 
  group_by(Bedrooms) %>% 
  summarize(mean_price = mean(Price))
ggplot(mean_price_bed, aes(x = factor(Bedrooms), y = mean_price)) +
  geom_bar(stat = "identity", fill = "salmon") +
  labs(title = "Average Price by Number of Bedrooms",
       x = "Number of Bedrooms",
       y = "Average Price (₹)")


ggplot(df, aes(x = factor(Offers))) +
  geom_bar(fill = "lightblue") +
  labs(title = "Distribution of Offers Received on Houses",
       x = "Number of Offers",
       y = "Count") +
  theme_minimal()







ggplot(df, aes(x = Price)) +
  geom_histogram(binwidth = 10000, fill = "blue", color = "black") +
  labs(title = "Distribution of House Prices",
       x = "Price",
       y = "Frequency") +
  theme_minimal()
plot(Price~Offers) 



ggplot(df, aes(x = Neighborhood, y = Price)) +
  geom_boxplot(fill = "lightblue") +
  labs(title = "Price Distribution by Neighborhood",
       x = "Neighborhood",
       y = "Price ($)")
