data <- read.table("household_power_consumption.txt", sep=";", header = TRUE, na.strings = "?")
data[,1] <- as.Date(data[,1], format="%d/%m/%Y")
data <- data[data$Date == "2007/2/1" | data$Date=="2007/2/2", ]
png("plot1.png", width=480, height=480)
hist(data$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()