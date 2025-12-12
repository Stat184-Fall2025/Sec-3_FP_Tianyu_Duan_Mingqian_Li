# install.packages("fredr")
# install.packages("dplyr")
# install.packages("ggplot2")
# install.package("WDI")

library(WDI)
library(dplyr)
library(ggplot2)
library(scales)

year <- 1995

# Find WDI indicators
# WDIsearch("fertility rate")
# WDIsearch("GDP per capita")
# WDIsearch("school enrollment, secondary")
# WDIsearch("life expectancy")

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
write.csv(clean, file="data.csv")

###################################################################################
ggplot(clean, aes(x=gdp_pc, y=fertility, color=region)) +
  geom_point(alpha=0.7,size=2) + 
  scale_x_log10(labels = scales::label_comma()) +
  geom_smooth(method = "lm", se=FALSE, aes(group=1), color="black") +
  labs(
    title = "GDP per Capita vs Fertility Rate by Country",
    color = "Continent / Region"
  )

ggplot(clean, aes(x=life_expectancy, y=fertility, color=region)) +
  geom_point(alpha=0.7,size=2) +
  geom_smooth(method = "lm", se=FALSE, aes(group=1), color="black") +
  labs(
    title = "Life Expectancy vs Fertility Rate by Country",
    color = "Continent / Region"
  )

ggplot(clean, aes(x=edu_sec, y=fertility, color=region)) +
  geom_point(alpha=0.7,size=2) +
  geom_smooth(method = "lm", se=FALSE, aes(group=1), color="black") + 
  labs(
    title = "Secondary Education Enrollment vs Fertility Rate by Country",
    color = "Continent / Region"
  )
###################################################################################
ggplot(clean, aes(x=gdp_pc, y=life_expectancy, color=region)) +
  geom_point(alpha=0.7,size=2) + 
  scale_x_log10(labels = scales::label_comma()) +
  geom_smooth(method = "lm", se=FALSE, aes(group=1), color="black") +
  labs(
    title = "GDP per Capita vs Life Expectancy by Country",
    color = "Continent / Region"
  )

ggplot(clean, aes(x=gdp_pc, y=edu_sec, color=region)) +
  geom_point(alpha=0.7,size=2) + 
  scale_x_log10(labels = scales::label_comma()) +
  geom_smooth(method = "lm", se=FALSE, aes(group=1), color="black") +
  labs(
    title = "GDP per Capita vs Secondary Education Enrollment by Country",
    color = "Continent / Region"
  )

