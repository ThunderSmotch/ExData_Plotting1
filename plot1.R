# Read and subset the data to only include 1/2/2007 and 2/2/2007
data <- read.table("household_power_consumption.txt", header = TRUE, sep=";", na.strings = "?")
data <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")

# Open device (480x480 px png)
png(filename = "plot1.png", width = 480, height = 480, units = "px")

#Plot 1 - Histogram of Global Active Power
hist(data$Global_active_power, col = "red", main = "Global Active Power", xlab="Global Active Power (kilowatts)")

# Save to PNG / Close device
dev.off()
