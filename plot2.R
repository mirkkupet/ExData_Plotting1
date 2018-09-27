# read in data
data <- data.frame(read.csv("household_power_consumption.txt", header = TRUE, sep=";", stringsAsFactors=FALSE))
data <- data[data$Date %in% c("1/2/2007","2/2/2007"),]
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data$Global_active_power <- as.numeric(data$Global_active_power)
data$Timestamp <- strptime(paste(data$Date, data$Time, sep=" "), format = "%Y-%m-%d %H:%M:%S")

# create plot
png("plot2.png", width=480, height=480)
plot(data$Timestamp, data$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="")
dev.off()