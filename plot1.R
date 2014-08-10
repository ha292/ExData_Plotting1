data <- read.table("household_power_consumption.txt", header=T, sep=";", colClasses=c("character", "character", "numeric", rep(NULL, 6)), na.strings="?")
d <- as.Date(data$Date, format="%d/%m/%Y")
x <- data[d == "2007-02-01" | d == "2007-02-02", c(3)]
plot.new()
png("plot1.png")
hist(x, main="Global Active Power", xlab="Global Active Power(kilowatts)", ylab="Frequency", col="red")
dev.off()
