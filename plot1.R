download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile = "data.zip")
unzip("data.zip")
epc=read.csv("household_power_consumption.txt", sep = ";", dec = ".", na.strings = "?", stringsAsFactors = F)

png(filename = "plo14.png")

epc=epc[grep("^0?(1|2)/0?2/2007", epc$Date), ]
epc$DateTime=strptime(paste(epc$Date, epc$Time), "%d/%m/%Y %H:%M:%S")

hist(epc$Global_active_power, xlab = "Global active power (kilowatts)", main = "Global active power", col = "red")

dev.off()

