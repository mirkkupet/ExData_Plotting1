# read in data
data <- data.frame(read.csv("household_power_consumption.txt", header = TRUE, sep=";", stringsAsFactors=FALSE))
data <- data[data$Date %in% c("1/2/2007","2/2/2007"),]
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data$Global_active_power <- as.numeric(data$Global_active_power)
data$Timestamp <- strptime(paste(data$Date, data$Time, sep=" "), format = "%Y-%m-%d %H:%M:%S")

# create plot
png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2), mar = c(4, 4, 2, 1), oma = c(0, 0, 2, 0))
with(data, {
    plot(data$Timestamp, data$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="")
    plot(data$Timestamp, data$Voltage, type="l", ylab="Voltage", xlab="datetime")
    plot(Timestamp, Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
    points(Timestamp, Sub_metering_2, col = "red", type="l")
    points(Timestamp, Sub_metering_3, col = "blue", type="l")
    legend("topright", lty=1, legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black","red", "blue"))
    plot(data$Timestamp, data$Global_reactive_power, type="l", ylab="Global_reactive_power", xlab="datetime")
})
dev.off()