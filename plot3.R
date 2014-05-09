data <- read.table("household_power_consumption.txt", sep=";", header = TRUE, na.strings = "?")
dates = as.Date(data$Date, format="%d/%m/%Y")
data <- data[dates == "2007/2/1" | dates == "2007/2/2", ]
times <- paste(data$Date, data$Time, sep = " ")
times <- strptime(times, format="%d/%m/%Y %H:%M:%S")
data[["Date_Time"]] <- times

png("plot3.png", width=480, height=480)
plot(data$Date_Time, data$Sub_metering_1, type="n", ylab="Energy sub metering", xlab="")
lines(data$Date_Time, data$Sub_metering_1)
lines(data$Date_Time, data$Sub_metering_2, col="red")
lines(data$Date_Time, data$Sub_metering_3, col="blue")
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black", "red", "blue"), lty=1)
dev.off()