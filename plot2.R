download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile = "data.zip")
unzip("data.zip")
epc=read.csv("household_power_consumption.txt", sep = ";", dec = ".", na.strings = "?", stringsAsFactors = F)

epc=epc[grep("^0?(1|2)/0?2/2007", epc$Date), ]
epc$DateTime=strptime(paste(epc$Date, epc$Time), "%d/%m/%Y %H:%M:%S")

png(filename = "plot2.png")

plot(epc$DateTime, epc$Global_active_power, type="l", xlab="", ylab="Global active power (kilowatts)")

dev.off()
