library(readxl)

rat <- read_excel("ratdata.xlsx")

#bar chart with rat_ across the x axis and value on y axis. Do 5 bars for each rat 

library(ggplot2)
library(dplyr)
library(tidyverse)


# Simulate some example data (Replace this with your actual data)
#drop 'age' column from rat
# Assuming 'rat' is your data frame and 'age' is the column to drop


df <- rat %>% select(-age)



df_long <- pivot_longer(df, cols = everything(), names_to = "Rat", values_to = "Value")

# Generate unique bar index (1 to 150) for x-axis
df_long$Bar_Index <- seq_len(nrow(df_long))

# Plot the data with 150 separate bars
ggplot(df_long, aes(x = factor(Bar_Index), y = Value, fill = Rat)) +
  geom_bar(stat = "identity") +
  theme_minimal() +
  labs(title = "Bar Chart with 150 Bars (5 per Rat)",
       x = "Bar Index",
       y = "Value") +
  theme(axis.text.x = element_blank(),  # Hide x-axis text since there are 150 bars
        axis.ticks.x = element_blank()) +
  scale_fill_viridis_d()
