install.packages("fredr")
install.packages("dplyr")
install.packages("ggplot2")

library(fredr)
library(dplyr)
library(ggplot2)

fredr_set_key("093a9a4e3c03099262c8c9a1c8149f16")

start_date <- as.Date("1960-01-01")

unemp_raw <- fredr(
  series_id = "UNRATE",
  observation_start = start_date
)

fedfunds_raw <- fredr(
  series_id = "FEDFUNDS",
  observation_start = start_date
)

cpi_raw <- fredr(
  series_id = "CPIAUCSL",
  observation_start = start_date
)
