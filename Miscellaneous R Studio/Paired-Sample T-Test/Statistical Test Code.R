# Paired t-test

# H0 (Null Hypothesis): There is no significant difference in productivity before and after training; Mean Difference = 0
# H1 (Alternative Hypothesis): There is a significant difference in productivity before and after training; Mean Difference ≠ 0

# Significance Level:
# α = 0.05
# Decision Rule: If p-value < 0.05 → Reject H0; If p-value > 0.05 → Fail to reject H0

# Interpretation: 
# Reject H0 = Training had significant impact
# Fail to reject H0 = No statistically significant impact

attach(paired_t_test)                                                      # Attach dataset so columns can be used directly without dataset$column
diff = `Productivity before training` - `Productivity after training`      # Calculate difference between before-training and after-training productivity

hist(diff, freq = F)                                                       # Create histogram of differences; freq=F shows density scale
lines(density(diff), lwd = 2)                                              # Add density curve to histogram; lwd=2 increases line thickness

t.test(`Productivity before training`,
       `Productivity after training`,
       paired = T)                                                         # Perform paired sample t-test to compare means before vs after training
