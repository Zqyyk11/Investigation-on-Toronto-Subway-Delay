#### Preamble ####
# Purpose: Download the raw data from opendatatoronto.
# Author: Charlie Zhang
# Date: Sep 23th, 2024
# Contact: zqycharlie.zhang@mail.utoronto.ca
# License: Open Government License - Toronto
# Pre-requisites: None
# Any other information needed? None



#### Workspace setup ####
library(opendatatoronto)
library(dplyr)

#### Download data ####
# get package
package <- show_package("996cfe8d-fb35-40ce-b569-698d51fc683b")
package

# List the resources available in this package
resources <- list_package_resources(package)

# View the names and formats of the resources
resource_id <- resources %>%
  filter(name == "ttc-subway-delay-data-2023", format == "XLSX") %>%
  pull(id)

# Download the Excel file and save it to the raw_data folder
subway_data <- get_resource(resource_id)

#### Save data ####
# change the_raw_data to whatever name you assigned when you downloaded it.
write.csv(subway_data, "data/raw_data/ttc_subway_delay_data_2023.csv", row.names = FALSE)




         
