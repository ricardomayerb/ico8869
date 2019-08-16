library(fpp2)

head(gold)
head(a10)
head(elec)
head(woolyrnq)
head(gas)

autoplot(gold)

which.max(gold)
gold[770]

# 2.10 Exercises
# Use the help function to explore what the series gold, woolyrnq and gas represent.
# 
# Use autoplot() to plot each of these in separate plots.
# What is the frequency of each series? Hint: apply the frequency() function.
# Use which.max() to spot the outlier in the gold series. Which observation was it?
#   Download the file tute1.csv from the book website, open it in Excel (or some other spreadsheet application), and review its contents. You should find four columns of information. Columns B through D each contain a quarterly series, labelled Sales, AdBudget and GDP. Sales contains the quarterly sales for a small company over the period 1981-2005. AdBudget is the advertising budget and GDP is the gross domestic product. All series have been adjusted for inflation.
# 
# You can read the data into R with the following script:
#   
#   tute1 <- read.csv("tute1.csv", header=TRUE)
# View(tute1)
# Convert the data to time series
# 
# mytimeseries <- ts(tute1[,-1], start=1981, frequency=4)
# (The [,-1] removes the first column which contains the quarters as we don’t need them now.)
# 
# Construct time series plots of each of the three series
# 
# autoplot(mytimeseries, facets=TRUE)
# Check what happens when you don’t include facets=TRUE.
# 
# Download some monthly Australian retail data from the book website. These represent retail sales in various categories for different Australian states, and are stored in a MS-Excel file.
# 
# You can read the data into R with the following script:
#   
#   retaildata <- readxl::read_excel("retail.xlsx", skip=1)
# The second argument (skip=1) is required because the Excel sheet has two header rows.
# 
# Select one of the time series as follows (but replace the column name with your own chosen column):
#   
#   myts <- ts(retaildata[,"A3349873A"],
#              frequency=12, start=c(1982,4))
# Explore your chosen retail time series using the following functions:
#   
#   autoplot(), ggseasonplot(), ggsubseriesplot(), gglagplot(), ggAcf()

# Can you spot any seasonality, cyclicity and trend? What do you learn about the series?


# Create time plots of the following time series: bicoal, chicken, dole, usdeaths, lynx, goog, writing, fancy, a10, h02.
# Use help() to find out about the data in each series.
# For the goog plot, modify the axis labels and title.
# Use the ggseasonplot() and ggsubseriesplot() functions to explore the seasonal patterns in the following time series: writing, fancy, a10, h02.
# What can you say about the seasonal patterns?
#   Can you identify any unusual years?