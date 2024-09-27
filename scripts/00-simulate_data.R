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
library(dplyr)
library(ggplot2)

# Set random seed for reproducibility
set.seed(096)

# Define parameters
lines <- c("Yonge-University", "Bloor-Danforth", "Sheppard", "Scarborough RT")
stations <- c("Kennedy", "Kipling", "Eglinton", "Union", "Finch", "Bloor", "Spadina")
days <- c("Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday")

# Define probabilities for delays on each line (based on real data insights)
line_prob <- c("Yonge-University" = 0.4, "Bloor-Danforth" = 0.35, "Sheppard" = 0.15, "Scarborough RT" = 0.10)

# Define a reasonable range for delay times (in minutes)
min_delay <- 2   # Minimum delay
max_delay <- 60  # Maximum delay

# Number of simulated data points
n_sim <- 2000  # Simulate 2000 subway delay events

# Generate simulated data
simulated_data <- data.frame(
  day = sample(days, n_sim, replace = TRUE),  # Randomly assign days of the week
  line = sample(lines, n_sim, replace = TRUE, prob = line_prob),  # Randomly assign subway lines based on probabilities
  station = sample(stations, n_sim, replace = TRUE),  # Randomly assign stations
  delay_minutes = runif(n_sim, min = min_delay, max = max_delay)  # Randomly assign delay times between min and max delay
)

# Summarize the simulated data to inspect the first few rows
head(simulated_data)

# Visualize the total delay minutes per subway line
ggplot(simulated_data, aes(x = line, y = delay_minutes, fill = line)) +
  geom_boxplot() +
  labs(title = "Simulated Subway Delay Data by Line", x = "Subway Line", y = "Delay Minutes") +
  theme_minimal()

# Visualize total delays by day of the week
ggplot(simulated_data, aes(x = day, y = delay_minutes, fill = day)) +
  geom_boxplot() +
  labs(title = "Simulated Subway Delay Data by Day of the Week", x = "Day of the Week", y = "Delay Minutes") +
  theme_minimal()

# Visualize total delays by stations
ggplot(simulated_data, aes(x = station, y = delay_minutes, fill = station)) +
  geom_boxplot() +
  labs(title = "Simulated Subway Delay Data by Station", x = "Station", y = "Delay Minutes") +
  theme_minimal()


