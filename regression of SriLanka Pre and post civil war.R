# Load the required packages
library(readr)
library(ggplot2)

# Set the path to the Excel file
path_to_csv <- "C:/Users/Sri Harsha/Documents/penn.csv"

# Load the csv file
pwt_data <- read_csv(path_to_csv)

# Select the required columns for Sri Lanka
pwt_SriLanka <- subset(pwt_data, countrycode == "LKA", select = c("year", "rgdpe"))

# Create a new column with the natural logarithm of RGDPE
pwt_SriLanka$LNRGDPE <- log(pwt_SriLanka$rgdpe)

# Split the data into two subsets based on year
pwt_before_1983 <- subset(pwt_SriLanka, year <= 1982)
pwt_after_1983 <- subset(pwt_SriLanka, year >= 1983)

# Run linear regression on data before 1983
regression_model_before <- lm(data = pwt_before_1983, LNRGDPE ~ year)

# Create scatter plot with regression line and confidence interval for data before 1983
ggplot(pwt_before_1983, aes(x = year, y = LNRGDPE)) +
  geom_point() +
  stat_smooth(method = "lm", se = TRUE, color = "red") +
  labs(title = "Regression of LNRGDPE on Year (Before 1982)", x = "Year", y = "LNRGDPE")

# Check the fit of the curve for data before 1983
summary(regression_model_before)

# Run linear regression on data after 1983
regression_model_after <- lm(data = pwt_after_1983, LNRGDPE ~ year)

# Create scatter plot with regression line and confidence interval for data after 1983
ggplot(pwt_after_1983, aes(x = year, y = LNRGDPE)) +
  geom_point() +
  stat_smooth(method = "lm", se = TRUE, color = "red") +
  labs(title = "Regression of LNRGDPE on Year (After 1983)", x = "Year", y = "LNRGDPE")

# Check the fit of the curve for data after 1983
summary(regression_model_after)

library(ggplot2)
library(gridExtra)

# plot 1
plot1 <- ggplot(pwt_before_1983, aes(x = year, y = LNRGDPE)) +
  geom_point() +
  stat_smooth(method = "lm", se = TRUE, color = "red") +
  labs(title = "Regression of LNRGDPE on Year (before 1983)", x = "Year", y = "LNRGDPE")

# plot 2
plot2 <- ggplot(pwt_after_1983, aes(x = year, y = LNRGDPE)) +
  geom_point() +
  stat_smooth(method = "lm", se = TRUE, color = "blue") +
  labs(title = "Regression of LNRGDPE on Year (after 1983)", x = "Year", y = "LNRGDPE")

# combine plots in the same window
grid.arrange(plot1, plot2, ncol = 2)

install.packages("car")
