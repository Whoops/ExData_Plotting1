data <- read.table("household_power_consumption.txt", sep=";", header = TRUE, na.strings = "?")
dates = as.Date(data$Date, format="%d/%m/%Y")
data <- data[dates == "2007/2/1" | dates == "2007/2/2", ]
times <- paste(data$Date, data$Time, sep = " ")
times <- strptime(times, format="%d/%m/%Y %H:%M:%S")
data[["Date_Time"]] <- times

png("plot2.png", width=480, height=480)
plot(data$Date_Time, data$Global_active_power, type="n", ylab="Global Active Power (kilowatts)", xlab="")
lines(data$Date_Time, data$Global_active_power)
dev.off()