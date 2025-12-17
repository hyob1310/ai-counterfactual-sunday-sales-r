# R/02_load_and_prepare_data.R
# Load restaurant sales data and prepare daily revenue
# Interpreted as McDonald's-like fast-food proxy

library(tidyverse)
library(readxl)
library(lubridate)

# Load data
path <- "data/restaurant_sales.xlsx"

if (!file.exists(path)) {
  stop("Dataset not found. Run 01_download_data.R first.")
}

df <- read_excel(path)

# Look at column names (for transparency)
print(names(df))

# Rename columns to be clean (dataset-specific)
df <- df %>%
  rename(
    date = transaction_date,
    sales = total_amount
  )

# Convert date
df$date <- as.Date(df$date)

# Aggregate to DAILY revenue
daily_sales <- df %>%
  group_by(date) %>%
  summarise(
    daily_revenue = sum(sales, na.rm = TRUE),
    .groups = "drop"
  )

# Create day-of-week features
daily_sales <- daily_sales %>%
  mutate(
    day_of_week = wday(date, label = TRUE),
    is_sunday = day_of_week == "Sun",
    is_saturday = day_of_week == "Sat"
  )

# Quick checks
cat("Date range:\n")
print(range(daily_sales$date))

cat("\nAverage revenue by day of week:\n")
print(
  daily_sales %>%
    group_by(day_of_week) %>%
    summarise(avg_revenue = mean(daily_revenue))
)

# Save prepared data
dir.create("data/processed", showWarnings = FALSE)
saveRDS(daily_sales, "data/processed/daily_sales.rds")

cat("\nSaved daily sales to data/processed/daily_sales.rds\n")
