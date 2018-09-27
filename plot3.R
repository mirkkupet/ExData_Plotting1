# read in data
data <- data.frame(read.csv("household_power_consumption.txt", header = TRUE, sep=";", stringsAsFactors=FALSE))
data <- data[data$Date %in% c("1/2/2007","2/2/2007"),]
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data$Global_active_power <- as.numeric(data$Global_active_power)
data$Timestamp <- strptime(paste(data$Date, data$Time, sep=" "), format = "%Y-%m-%d %H:%M:%S")

# create plot
png("plot3.png", width=480, height=480)
with(data, plot(Timestamp, Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering"))
with(data, points(Timestamp, Sub_metering_2, col = "red", type="l"))
with(data, points(Timestamp, Sub_metering_3, col = "blue", type="l"))
legend("topright", lty=1, legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black","red", "blue"))
dev.off()