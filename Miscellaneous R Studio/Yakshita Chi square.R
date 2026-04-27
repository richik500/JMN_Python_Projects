# Set working directory if needed:
# setwd("C:/path/to/your/folder")
attach(Responses)
# Read only the chi-square sheets
h1_data <- read_excel("C:/Users/richi/Downloads/Responses.xlsx", 
                      sheet = "chi-sq h1")

h2_data <- read_excel("C:/Users/richi/Downloads/Responses.xlsx", 
                      sheet = "chi-sq h2")

# Quick check
head(h1_data)
head(h2_data)

# Clean labels for Hypothesis 1 sheet
h1_data <- h1_data %>%
  mutate(
    Startup_Size  = gsub("^\\( \\)\\s*", "", Startup_Size),
    CRM_Adoption  = gsub("^\\( \\)\\s*", "", CRM_Adoption),
    Startup_Size  = factor(Startup_Size),
    CRM_Adoption  = factor(CRM_Adoption)
  )

# Clean labels for Hypothesis 2 sheet
h2_data <- h2_data %>%
  mutate(
    Formal_Financial_Planning = gsub("^\\( \\)\\s*", "", Formal_Financial_Planning),
    Compliance_Ease           = gsub("^\\( \\)\\s*", "", Compliance_Ease),
    Formal_Financial_Planning = factor(Formal_Financial_Planning),
    Compliance_Ease           = factor(Compliance_Ease)
  )

# ===== H1: Startup size vs CRM adoption =====

# Create contingency table
tab_h1 <- table(h1_data$Startup_Size, h1_data$CRM_Adoption)
tab_h1   # observed counts

# Chi-square test of independence
chisq_h1 <- chisq.test(tab_h1)

# View full test output
chisq_h1

# Optional: view expected counts
chisq_h1$expected

p_val_h1 <- chisq_h1$p.value
p_val_h1
if (p_val_h1 < 0.05) {
  cat("For H1: Reject H0₁. There is a significant relationship between startup size/age and CRM adoption.\n")
} else {
  cat("For H1: Fail to reject H0₁. No statistically significant relationship found between startup size/age and CRM adoption.\n")
}




library(ggplot2)

h1_plot_data <- as.data.frame(tab_h1)
colnames(h1_plot_data) <- c("Startup_Size", "CRM_Adoption", "Freq")

ggplot(h1_plot_data, aes(x = Startup_Size, y = Freq, fill = CRM_Adoption)) +
  geom_bar(stat = "identity", position = "fill") +
  scale_y_continuous(labels = scales::percent_format()) +
  labs(
    title = "CRM Adoption by Startup Size",
    x = "Startup Size",
    y = "Proportion of Startups",
    fill = "CRM Adoption Level"
  ) +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

mosaicplot(tab_h1,
           main = "Mosaic Plot: Startup Size vs CRM Adoption",
           xlab = "Startup Size",
           ylab = "CRM Adoption")

# ===== H2: Financial planning vs Compliance ease =====

# Contingency table
tab_h2 <- table(h2_data$Formal_Financial_Planning,
                h2_data$Compliance_Ease)
tab_h2   # observed counts

# Chi-square test of independence
chisq_h2 <- chisq.test(tab_h2)

# View test result
chisq_h2

# Expected counts
chisq_h2$expected

p_val_h2 <- chisq_h2$p.value
p_val_h2
if (p_val_h2 < 0.05) {
  cat("For H2: Reject H0₂. There is a significant association between financial planning level and compliance awareness/ease.\n")
} else {
  cat("For H2: Fail to reject H0₂. No statistically significant association found between financial planning level and compliance awareness/ease.\n")
}

h2_plot_data <- as.data.frame(tab_h2)
colnames(h2_plot_data) <- c("Financial_Planning", "Compliance_Ease", "Freq")

ggplot(h2_plot_data, aes(x = Financial_Planning, y = Freq, fill = Compliance_Ease)) +
  geom_bar(stat = "identity", position = "fill") +
  scale_y_continuous(labels = scales::percent_format()) +
  labs(
    title = "Compliance Ease by Financial Planning Level",
    x = "Financial Planning Level",
    y = "Proportion of Startups",
    fill = "Compliance Ease"
  ) +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

mosaicplot(tab_h2,
           main = "Mosaic Plot: Financial Planning vs Compliance Ease",
           xlab = "Financial Planning Level",
           ylab = "Compliance Ease")

