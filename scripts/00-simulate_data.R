#### Preamble ####
# Purpose: Simulates subway delay data.
# Author: Charlie Zhang
# Date: Sep 23th, 2024
# Contact: zqycharlie.zhang@mail.utoronto.ca
# License: Open Government License - Toronto
# Pre-requisites: None
# Any other information needed? None



#### Workspace setup ####
library(tidyverse)

#### Simulate data ####
set.seed(123)
n <- 100
simulated_data <- data.frame(
  date = seq(as.Date('2020-01-01'), by = "day", length.out = n),
  transportation_usage = rpois(n, lambda = 200),
  location = sample(c("Downtown", "Midtown", "Suburb"), n, replace = TRUE)
)

# Print sample data
print(head(simulated_data))

