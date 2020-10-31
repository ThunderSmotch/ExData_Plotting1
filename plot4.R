# Read and subset the data to only include 1/2/2007 and 2/2/2007
data <- read.table("household_power_consumption.txt", header = TRUE, sep=";", na.strings = "?")
data <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")

# Add new columns with the parsed time and date called instant
data$Instant = strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")

# Open device (480x480 px png)
png(filename = "plot4.png", width = 480, height = 480, units = "px")

# Set parameters
par(mfrow=c(2,2))

#Subplot 1 - Same as Plot 2 - Global Active Power vs Time Instant
plot(data$Instant, data$Global_active_power, xlab = "", ylab = "Global Active Power", type="n")
lines(data$Instant, data$Global_active_power)

#Subplot 2 - Plot of Voltage vs Time Instant
plot(data$Instant, data$Voltage, xlab = "datetime", ylab = "Voltage", type="n")
lines(data$Instant, data$Voltage)

#Subplot 3 - Same as Plot 3 - Plot of three sub meters
max <- max(data$Sub_metering_1, data$Sub_metering_2, data$Sub_metering_3)
plot(data$Instant, data$Sub_metering_1, ylim=c(0, max), xlab = "", ylab = "Energy sub metering", type="n")
lines(data$Instant, data$Sub_metering_1, col="black")
lines(data$Instant, data$Sub_metering_2, col="red")
lines(data$Instant, data$Sub_metering_3, col="blue")
legend("topright", col=c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = "solid",bty="n")

#Subplot 4 - Global Reactive Power vs Time Instant
plot(data$Instant, data$Global_reactive_power, xlab = "datetime", ylab="Global_reactive_power", type="n")
lines(data$Instant, data$Global_reactive_power)

# Save to PNG / Close device
dev.off()
