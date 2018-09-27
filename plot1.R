# read in data
data <- data.frame(read.csv("household_power_consumption.txt", header = TRUE, sep=";", stringsAsFactors=FALSE))
data <- data[data$Date %in% c("1/2/2007","2/2/2007"),]
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data$Global_active_power <- as.numeric(data$Global_active_power)

# create plot
png("plot1.png", width =480, height=480)
hist(data$Global_active_power, breaks=13, main = "Global Active Power", ylab="Frequency", xlab="Global Active Power (kilowatts)", col="red")
dev.off()