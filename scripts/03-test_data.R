#### Preamble ####
# Purpose: Test the cleaned data.
# Author: Charlie Zhang
# Date: Sep 23th, 2024
# Contact: zqycharlie.zhang@mail.utoronto.ca
# License: Open Government License - Toronto
# Pre-requisites: None
# Any other information needed? None


#### Workspace setup ####
library(tidyverse)

#### Test data ####
# Check for the number of NA values in each column
colSums(is.na(cleaned_data))

# Remove rows with any missing values
cleaned_data <- na.omit(cleaned_data)

# Check if any values in 'Min Delay' are negative
incorrect_delays <- cleaned_data %>%
  filter(`Min Delay` < 0)

# Remove rows where 'Min Delay' is negative
cleaned_data <- cleaned_data %>%
  filter(`Min Delay` >= 0)

# Summary of the cleaned data
summary(cleaned_data)

# Check the first few rows of the cleaned data
head(cleaned_data)

