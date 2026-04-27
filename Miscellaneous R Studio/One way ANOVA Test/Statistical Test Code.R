attach(X1wayanova)                                     # Attach dataset so column names can be used directly
summary(X1wayanova)                                    # Display summary statistics of all variables in dataset
type = as.factor(type, data)                           # Convert type variable into factor (categorical variable)
type = factor(type, labels = c("car","jeep","truck"))  # Rename factor levels as car, jeep, and truck
summary(type)                                          # Show count/frequency of each vehicle category

library(car)                                           # Load car package for Levene's Test
leveneTest(sales, type, data = X1wayanova)             # Test equality of variances among car, jeep, and truck sales groups
# H0: Variances of all groups are equal
# H1: Variances of groups are different
# If p-value > 0.05 = Equal variance assumed
# If p-value < 0.05 = Unequal variance

oneway.test(sales ~ type, data = X1wayanova)           # Perform Welch One-Way ANOVA to compare mean sales across groups
# H0: Mean sales of car, jeep, and truck are equal
# H1: At least one group mean is different
# If p-value < 0.05 = Significant difference exists

library(rstatix)                                       # Load rstatix package for Games-Howell post hoc test
games_howell_test(sales ~ type, data = X1wayanova)     # Perform Games-Howell pairwise comparison between groups
# Used when variances are unequal and sample sizes differ
# If p-value < 0.05 = Significant pairwise difference

a = aov(sales ~ type, data = X1wayanova)               # Create standard One-Way ANOVA model
summary(a)                                             # Display ANOVA table with F-value and p-value
# H0: Mean sales of all groups are equal
# H1: At least one mean differs
# If p-value < 0.05 = Reject H0

b = TukeyHSD(a)                                        # Perform Tukey Honest Significant Difference post hoc test
b                                                      # Show pairwise group mean comparisons with confidence intervals and p-values

# If p-value < 0.05 = Significant difference between that pair
