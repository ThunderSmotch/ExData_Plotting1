# Read and subset the data to only include 1/2/2007 and 2/2/2007
data <- read.table("household_power_consumption.txt", header = TRUE, sep=";", na.strings = "?")
data <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")

# Add new columns with the parsed time and date called instant
data$Instant = strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")

# Open device (480x480 px png)
png(filename = "plot3.png", width = 480, height = 480, units = "px")

# Plot 3 - Time plot of the several sub meters

# Grab the maximum value to set it as the y limit of the plot
max <- max(data$Sub_metering_1, data$Sub_metering_2, data$Sub_metering_3)
plot(data$Instant, data$Sub_metering_1, ylim=c(0, max), xlab = "", ylab = "Energy sub metering", type="n")
lines(data$Instant, data$Sub_metering_1, col="black")
lines(data$Instant, data$Sub_metering_2, col="red")
lines(data$Instant, data$Sub_metering_3, col="blue")
legend("topright", col=c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = "solid")

# Save to PNG / Close device
dev.off()
