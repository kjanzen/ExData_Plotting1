### IMPORT DATA ###
ec <- read.table("./household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?") #Make sure the file is in the right path
ec$Date <- as.Date(ec$Date, format = "%d/%m/%Y") #Converts characters to Date format for Date column
ec_feb <- subset(ec, ec$Date >= "2007-02-01" & ec$Date <= "2007-02-02") #Subsets Feb 1st and Feb 2nd 2007 data only
ec_feb$Time <- strptime(paste(ec_feb$Date, ec_feb$Time), "%Y-%m-%d %H:%M:%S") #Converts Time to Date + Time

### CREATE PLOT ###
plot(ec_feb$Time, ec_feb$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "")
lines(ec_feb$Time, ec_feb$Sub_metering_2, col = "red")
lines(ec_feb$Time, ec_feb$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col = c("black","red","blue"), lty = c(1,1,1))

### SAVE TO PNG ###
dev.copy(png, "./plot3.png", width = 480, height = 480)
dev.off()