# R/01_download_data.R
# Download public restaurant sales data (proxy for fast-food demand)

dir.create("data", showWarnings = FALSE)

url <- "https://raw.githubusercontent.com/Ahmedabbas75/Coffee-Shop-Sales/main/Coffee%20Shop%20Sales.xlsx"
dest <- file.path("data", "restaurant_sales.xlsx")

if (!file.exists(dest)) {
  download.file(url, dest, mode = "wb")
  message("Dataset downloaded to data/restaurant_sales.xlsx")
} else {
  message("Dataset already exists")
}
