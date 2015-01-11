png(file = "plot4.png")
householdPower <- read.table("household_power_consumption.txt", sep = ";", header=TRUE, stringsAsFactors = FALSE)
householdPowerSubset <- as.data.table(householdPower)
newHousehold <- mutate(householdPowerSubset, Date = as.Date(dmy(Date)))
newHousehold2 <- filter(newHousehold, Date == "2007-02-01" | Date == "2007-02-02")
newHousehold3 <- mutate(newHousehold2, DateTime = as.POSIXct(paste(Date, Time), format = "%Y-%m-%d %H:%M:%OS")) 

par(mfrow = c(2, 2))

# Global active power plot
plot(newHousehold5$DateTime, as.numeric(newHousehold5$Global_active_power), "l", xlab = "", ylab ="Global Active Power (kilowatts)")

# Voltage plot
plot(newHousehold3$DateTime, newHousehold3$Voltage, type="l",ylab="Voltage", xlab="datetime")

# Sub metering plot
plot(newHousehold3$DateTime, newHousehold3$Sub_metering_1, type="n",ylab="Energy sub metering", xlab="")
points(newHousehold3$DateTime, newHousehold3$Sub_metering_1, type="l", col="black")
points(newHousehold3$DateTime, newHousehold3$Sub_metering_2, type="l", col="red")
points(newHousehold3$DateTime, newHousehold3$Sub_metering_3, type="l", col="blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex = 1, col = c("black", "red", "blue"), lty = c(1,1,1))

# Global reactive power plot
plot(newHousehold3$DateTime, newHousehold3$Global_reactive_power, type="l",ylab="Global_reactive_power", xlab="datetime")
dev.off()