# First download the data set

file <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(file, destfile = "household_power_consumption.zip", method = "curl")

# Next the data will be unzipped into a file called "household_power_consumption.txt"

unzip("household_power_consumption.zip")