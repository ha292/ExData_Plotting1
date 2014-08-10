data <- read.table("household_power_consumption.txt", header=T, sep=";", colClasses=c("character", "character", rep("numeric", 7)), na.strings="?")
d <- as.Date(data$Date, format="%d/%m/%Y")
x <- data[d == "2007-02-01" | d == "2007-02-02", ]
t <- strptime(paste(x$Date, x$Time), format="%d/%m/%Y %H:%M:%S")

png("plot4.png")
par(mfrow=c(2,2))
plot(t, x$Global_active_power, xlab="", ylab="Global Active Power", type="n")
lines(t, x$Global_active_power, type="l", col="black")

plot(t, x$Voltage, xlab="datetime", ylab="Voltage", type="n")
lines(t, x$Voltage, type="l", col="black")

plot(t, x$Sub_metering_1, xlab="", ylab="Energy sub metering", type="n")
lines(t, x$Sub_metering_1, type="l", col="black")
lines(t, x$Sub_metering_2, type="l", col="red")
lines(t, x$Sub_metering_3, type="l", col="blue")
legend("topright", "(x,y)", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lty=1, bty="n")

plot(t, x$Global_reactive_power, xlab="datetime", ylab="Global_reactive_power", type="n")
lines(t, x$Global_reactive_power, type="l", col="black")

dev.off()
