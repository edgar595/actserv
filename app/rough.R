library(nycflights13)
library(tidyverse)



# Load the flights dataset
data(flights)
skimr::skim(flights)

summary(flights)

# Summary of numerical variables
summary(flights_df[c("dep_delay", "arr_delay", "air_time", "distance")])

flights_df <- flights %>%
  mutate(month = month.name[month]) %>%
  na.omit()

flights_df %>%
  count(month)

# Filter flights with distance greater than 1000 miles
flights_df %>%
  filter(distance > 3000) %>%
  count(dest,origin, sort = TRUE)

flights_df %>%
  group_by(month) %>%
  summarise(distance_covered = sum(distance)) %>%
  arrange(desc(distance_covered))

# Frequency table for origin
table(flights_df$origin)

# Frequency table for destination
table(flights_df$dest)


# Histogram of departure delay
ggplot(flights_df, aes(x = dep_delay)) +
  geom_histogram(binwidth = 5, fill = "skyblue", color = "black") +
  labs(title = "Distribution of Departure Delay",
       x = "Departure Delay (minutes)",
       y = "Frequency")+
  xlim(0,200)

# Boxplot of arrival delay by carrier
ggplot(flights_df, aes(x = carrier, y = arr_delay, fill = carrier)) +
  geom_boxplot(show.legend = FALSE) +
  labs(title = "Arrival Delay by Carrier",
       x = "Carrier",
       y = "Arrival Delay (minutes)",
       fill = "Carrier")











