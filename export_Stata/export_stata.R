library(btmembers)
library(dplyr) # Data wrangling
library(haven) # Export to Stata
library(readr) # Import CSV files

# We need to split the dataset because haven does not handle long string 
# variables. 

members %>%
  select(-vita_kurz, -veroeffentlichungspflichtiges) %>%
  write_dta("temp/members1.dta")

members %>%
  select(id, wp, vita_kurz, veroeffentlichungspflichtiges) %>%
  write_csv("temp/members2.csv")