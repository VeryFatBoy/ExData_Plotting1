# First read the file
# Assumption: download_data.R already run and input file created

power_data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

# Use as.Date() to convert first column date format to YYYY-MM-DD

power_data$Date <- as.Date(power_data$Date, "%d/%m/%Y")

# We are only interested in dates from 2007-02-01 to 2007-02-02

power_data <- subset(power_data, Date == "2007-02-01" | Date == "2007-02-02")

# Create a new DateTime column combining the Date and Time columns

power_data$DateTime <- strptime(paste(power_data$Date, power_data$Time), format = "%Y-%m-%d %H:%M:%S")

# Create the plot

png("plot3.png", width = 480, height = 480)
plot(power_data$DateTime, power_data$Sub_metering_1, type = "l", col = "black", xlab = "", ylab = "Energy sub metering")
lines(power_data$DateTime, power_data$Sub_metering_2, type = "l", col = "red")
lines(power_data$DateTime, power_data$Sub_metering_3, type = "l", col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = c(1, 1, 1))
dev.off()