install.packages("fredr")
install.packages("dplyr")
install.packages("ggplot2")
install.package("WDI")

library(WDI)
library(dplyr)
library(ggplot2)

year -> 2024

# Find indicators
# WDIsearch("fertility rate")
# WDIsearch("GDP per capita")
# WDIsearch("school enrollment, secondary")
WDIsearch("life expectancy")

raw <- WDI(
  country = "all",
  indicator = c(
    fertility = "SP.DYN.TFRT.IN",
    gdp_pc = "NY.GDP.PCAP.CD",
    edu_sec = "SE.SEC.ENRR",
    life_expectancy = "SP.DYN.LE00.IN"
  ),
  start = year,
  end = year,
  extra = TRUE
)

colnames(raw)

clean <- raw %>%
  select("country","region","fertility","gdp_pc","edu_sec","life_expectancy") %>%
  filter(region != "Aggregates")

