# install.packages("fredr")
# install.packages("dplyr")
# install.packages("ggplot2")
# install.package("WDI")

library(WDI)
library(dplyr)
library(ggplot2)
library(scales)

year -> 1995

# Find WDI indicators
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
) # Extracts data directly using WDI

colnames(raw)

# select columns from raw data and filter rows
clean <- raw %>% 
  select("country","region","fertility","gdp_pc","edu_sec","life_expectancy") %>%
  filter(region != "Aggregates")

ggplot(dat, aes(x=gdp_pc, y=fertility, color=region)) +
  geom_point(alpha=0.7,size=2) + 
  scale_x_log10(labels = scales::label_comma())

ggplot(dat, aes(x=life_expectancy, y=fertility, color=region)) +
  geom_point(alpha=0.7,size=2)

ggplot(dat, aes(x=edu_sec, y=fertility, color=region)) +
  geom_point(alpha=0.7,size=2)
