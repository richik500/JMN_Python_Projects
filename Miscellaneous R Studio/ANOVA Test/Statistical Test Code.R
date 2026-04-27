# ANOVA Test
# H0 : There is no significant difference between category means
# H1 : At least one category mean is significantly different

# Significance Level (α) = 0.05
# If p-value < 0.05 → Reject H0
# If p-value > 0.05 → Fail to reject H0

# Step 1: Checking variance using Levene Test
attach(ANOVA)                                       # Attach dataset so columns can be used directly
summary(ANOVA)                                      # Display summary statistics of dataset variables
type = as.factor(type)                              # Convert type variable into categorical factor
summary(type)                                       # Show frequency/count of each category in type

library(car)                                        # Load car package for Levene's Test

leveneTest(sales, type, data = ANOVA)               # Test equality of variances among categories
# Levene Test Hypothesis:
# H0: Variances are equal across all groups
# H1: Variances are not equal

# Decision:
# p-value > 0.05 → Equal variance assumed
# p-value < 0.05 → Variances significantly different

oneway.test(sales ~ type, data = ANOVA)            # Perform Welch One-Way ANOVA (used when variances may be unequal)
# Hypothesis:
# H0: Mean sales of all categories are equal
# H1: At least one group mean is different

# Decision:
# p-value < 0.05 → Significant mean difference exists

library(rstatix)                                    # Load rstatix package for post hoc tests
games_howell_test(sales ~ type, data = ANOVA)       # Perform Games-Howell post hoc test
# Used when variances are unequal and sample sizes differ

# Hypothesis:
# H0: Compared group means are equal
# H1: Compared group means are different

# Decision:
# p-value < 0.05 → That pair has significant difference

a = aov(sales ~ type, data = ANOVA)                 # Perform standard One-Way ANOVA model
summary(a)                                          # Display ANOVA table with F-statistic and p-value

# Hypothesis:
# H0: Mean sales of all groups are equal
# H1: At least one group mean differs

# Decision:
# p-value < 0.05 → Reject H0

b = TukeyHSD(a)                                      # Perform Tukey Honest Significant Difference post hoc test
b                                                    # Show pairwise group comparisons with confidence intervals and p-values

# Hypothesis:
# H0: Mean difference between each pair = 0
# H1: Mean difference between each pair ≠ 0

# Decision:
# p-value < 0.05 → Significant difference between that pair

plot(b)                                               # Plot Tukey HSD confidence intervals for pairwise comparisons
