# install.packages("fredr")
# install.packages("dplyr")
# install.packages("ggplot2")
# install.package("WDI")
# install.package("tidyverse")

library(WDI)
library(dplyr)
library(ggplot2)
library(scales)
library(tidyverse)

year <- 2018

# Find WDI indicators
# WDIsearch("fertility rate")
# WDIsearch("GDP per capita")
# WDIsearch("school enrollment, secondary")
# WDIsearch("life expectancy")

###################################################################################
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

# colnames(raw)

# select columns from raw data and filter rows
clean <- raw %>% 
  select("country","region","fertility","gdp_pc","edu_sec","life_expectancy") %>%
  filter(region != "Aggregates")

write.csv(clean, file="data.csv")

clean <- read.csv("data.csv")

###################################################################################

ggplot(clean, aes(x=gdp_pc, y=fertility, color=region)) +
  geom_point(alpha=0.7,size=2) + 
  scale_x_log10(labels = scales::label_comma()) +
  geom_smooth(method = "lm", se=FALSE, aes(group=1), color="black") +
  labs(
    title = paste("GDP per Capita vs Fertility Rate by Country (",year,")"),
    color = "Continent / Region"
  )

ggplot(clean, aes(x=life_expectancy, y=fertility, color=region)) +
  geom_point(alpha=0.7,size=2) +
  geom_smooth(method = "lm", se=FALSE, aes(group=1), color="black") +
  labs(
    title = paste("Life Expectancy vs Fertility Rate by Country (",year,")"),
    color = "Continent / Region"
  )

ggplot(clean, aes(x=edu_sec, y=fertility, color=region)) +
  geom_point(alpha=0.7,size=2) +
  geom_smooth(method = "lm", se=FALSE, aes(group=1), color="black") + 
  labs(
    title = paste("Secondary Education Enrollment vs Fertility Rate by Country (",year,")"),
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
###################################################################################

# we will explore regional trends in this section.

east_asia_pacific <- clean %>%
  filter(region == "East Asia & Pacific")
europe_cental_asia <- clean %>%
  filter(region == "Europe & Central Asia")
latin_america_caribbean <- clean %>%
  filter(region == "Latin America & Caribbean")
middle_east_north_africa <- clean %>%
  filter(region == "Middle East & North Africa")
sub_saharan_africa <- clean %>%
  filter(region == "Sub-Saharan Africa")

# East Asia & Pacific trend
ggplot(east_asia_pacific, aes(x=gdp_pc, y=fertility)) +
  geom_point(alpha=0.7,size=2) + 
  scale_x_log10(labels = scales::label_comma()) +
  geom_smooth(method = "lm", se=FALSE, color="black") +
  labs(
    title = paste("GDP per Capita vs Fertility Rate by Country (East Asia & Pacific,",year,")"),
    color = "Continent / Region"
  )

# East Asia & Pacific trend
ggplot(east_asia_pacific, aes(x=gdp_pc, y=fertility)) +
  geom_point(alpha=0.7,size=2) + 
  scale_x_log10(labels = scales::label_comma()) +
  geom_smooth(method = "lm", se=FALSE, color="black") +
  labs(
    title = paste("GDP per Capita vs Fertility Rate by Country (East Asia & Pacific,",year,")"),
    color = "Continent / Region"
  )

# East Asia & Pacific trend
ggplot(east_asia_pacific, aes(x=gdp_pc, y=fertility)) +
  geom_point(alpha=0.7,size=2) + 
  scale_x_log10(labels = scales::label_comma()) +
  geom_smooth(method = "lm", se=FALSE, color="black") +
  labs(
    title = paste("GDP per Capita vs Fertility Rate by Country (East Asia & Pacific,",year,")"),
    color = "Continent / Region"
  )

# East Asia & Pacific trend
ggplot(east_asia_pacific, aes(x=gdp_pc, y=fertility)) +
  geom_point(alpha=0.7,size=2) + 
  scale_x_log10(labels = scales::label_comma()) +
  geom_smooth(method = "lm", se=FALSE, color="black") +
  labs(
    title = paste("GDP per Capita vs Fertility Rate by Country (East Asia & Pacific,",year,")"),
    color = "Continent / Region"
  )

# East Asia & Pacific trend
ggplot(east_asia_pacific, aes(x=gdp_pc, y=fertility)) +
  geom_point(alpha=0.7,size=2) + 
  scale_x_log10(labels = scales::label_comma()) +
  geom_smooth(method = "lm", se=FALSE, color="black") +
  labs(
    title = paste("GDP per Capita vs Fertility Rate by Country (East Asia & Pacific,",year,")"),
    color = "Continent / Region"
  )

# East Asia & Pacific trend
ggplot(east_asia_pacific, aes(x=gdp_pc, y=fertility)) +
  geom_point(alpha=0.7,size=2) + 
  scale_x_log10(labels = scales::label_comma()) +
  geom_smooth(method = "lm", se=FALSE, color="black") +
  labs(
    title = paste("GDP per Capita vs Fertility Rate by Country (East Asia & Pacific,",year,")"),
    color = "Continent / Region"
  )

# Combined chart
ggplot(clean, aes(x=gdp_pc, y=fertility, color=region)) +
  geom_point(alpha=0.7,size=2) + 
  scale_x_log10(labels = scales::label_comma()) +
  geom_smooth(method = "lm", se=FALSE) +
  labs(
    title = paste("GDP per Capita vs Fertility Rate by Country (",year,")"),
    color = "Continent / Region"
  )
