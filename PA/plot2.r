### IMPORT DATA ###
ec <- read.table("./household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?") #Make sure the file is in the right path
ec$Date <- as.Date(ec$Date, format = "%d/%m/%Y") #Converts characters to Date format for Date column
ec_feb <- subset(ec, ec$Date >= "2007-02-01" & ec$Date <= "2007-02-02") #Subsets Feb 1st and Feb 2nd 2007 data only
ec_feb$Time <- strptime(paste(ec_feb$Date, ec_feb$Time), "%Y-%m-%d %H:%M:%S") #Converts Time to Date + Time

### CREATE PLOT ###
plot(ec_feb$Time, ec_feb$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")

### SAVE TO PNG ###
dev.copy(png, "./plot2.png", width = 480, height = 480)
dev.off()