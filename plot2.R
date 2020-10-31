# Read and subset the data to only include 1/2/2007 and 2/2/2007
data <- read.table("household_power_consumption.txt", header = TRUE, sep=";", na.strings = "?")
data <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")

# Add new columns with the parsed time and date called instant
data$Instant = strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")

# Open device (480x480 px png)
png(filename = "plot2.png", width = 480, height = 480, units = "px")

#Plot 2 - Time plot of Global Active Power
plot(data$Instant, data$Global_active_power, xlab = "", ylab = "Global Active Power (kilowatts)", type="n")
lines(data$Instant, data$Global_active_power)

# Save to PNG / Close device
dev.off()
