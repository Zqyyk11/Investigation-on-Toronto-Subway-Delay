#### Preamble ####
# Purpose: Cleans the data and removes any NA variables/useless columns.
# Author: Charlie Zhang
# Date: Sep 23th, 2024
# Contact: zqycharlie.zhang@mail.utoronto.ca
# License: Open Government License - Toronto
# Pre-requisites: None
# Any other information needed? None

#### Workspace setup ####
library(tidyverse)
library(dplyr)

#### Clean data ####
# Select only the useful columns
cleaned_data <- subway_data %>%
  select(Date, Time, Day, Station, `Min Delay`,`Min Gap`, Line)

# Remove rows with missing values in the selected columns
cleaned_data <- cleaned_data %>%
  filter(!is.na(Date), !is.na(Time), !is.na(Day), !is.na(Station), 
         !is.na(`Min Delay`), !is.na(`Min Gap`), !is.na(Line))

# Check the cleaned data
head(cleaned_data)

#### Save data ####
write_csv(cleaned_data, "data/analysis_data/cleaned_subway_delay_data.csv")

