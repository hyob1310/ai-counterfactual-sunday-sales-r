# R/05_plot_sunday_scenarios.R
# Plot counterfactual Chick-fil-A Sunday revenue scenarios

library(tidyverse)

# Load estimates
cfa_estimates <- readRDS("data/analysis/cfa_sunday_revenue_estimates.rds")

# Prepare data for plotting
plot_df <- cfa_estimates %>%
  mutate(
    scenario = factor(scenario, levels = c("Conservative", "Moderate", "Aggressive"))
  )

# Create plot
p <- ggplot(plot_df, aes(x = scenario, y = estimated_sunday_revenue)) +
  geom_col(fill = "steelblue") +
  labs(
    title = "Estimated Chick-fil-A Sunday Revenue (Counterfactual)",
    subtitle = "Scenarios based on McDonald's Sunday/Saturday patterns",
    x = "Scenario",
    y = "Estimated Sunday Revenue"
  ) +
  theme_minimal()

# Save plot
dir.create("reports", showWarnings = FALSE)
ggsave(
  filename = "reports/cfa_sunday_revenue_scenarios.png",
  plot = p,
  width = 8,
  height = 5
)

cat("Saved plot to reports/cfa_sunday_revenue_scenarios.png\n")
