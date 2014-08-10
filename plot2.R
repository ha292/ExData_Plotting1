data <- read.table("household_power_consumption.txt", header=T, sep=";", colClasses=c("character", "character", "numeric", rep(NULL, 6)), na.strings="?")
d <- as.Date(data$Date, format="%d/%m/%Y")
x <- data[d == "2007-02-01" | d == "2007-02-02", c(1:3)]
t <- strptime(paste(x$Date, x$Time), format="%d/%m/%Y %H:%M:%S")
plot.new()
png("plot2.png")
plot(t, x$Global_active_power, xlab="", ylab="Global Active Power (kilowatts)", type="n")
lines(t, x$Global_active_power, type="l")
dev.off()
