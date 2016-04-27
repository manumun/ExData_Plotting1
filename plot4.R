download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile = "data.zip")
unzip("data.zip")
epc=read.csv("household_power_consumption.txt", sep = ";", dec = ".", na.strings = "?", stringsAsFactors = F)

epc=epc[grep("^0?(1|2)/0?2/2007", epc$Date), ]
epc$DateTime=strptime(paste(epc$Date, epc$Time), "%d/%m/%Y %H:%M:%S")

plot.new()

png(filename = "plot4.png")

par(mfrow=c(2,2))
plot(epc$DateTime, epc$Global_active_power, type="l", xlab="", ylab="Global active power")

plot(epc$DateTime, epc$Voltage, type="l", xlab="datetime", ylab="Voltage")

plot(epc$DateTime, epc$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering", col="red")
points(epc$DateTime, epc$Sub_metering_2, type="l", xlab="", col="green")
points(epc$DateTime, epc$Sub_metering_3, type="l", xlab="", col="blue")
legend("topright", lty = 1, col = c("red", "green", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

plot(epc$DateTime, epc$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()
