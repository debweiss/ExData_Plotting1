png(file = "plot3.png")
householdPower <- read.table("household_power_consumption.txt", sep = ";", header=TRUE, stringsAsFactors = FALSE)
householdPowerSubset <- as.data.table(householdPower)
newHousehold <- mutate(householdPowerSubset, Date = as.Date(dmy(Date)))
newHousehold2 <- filter(newHousehold, Date == "2007-02-01" | Date == "2007-02-02")
newHousehold3 <- mutate(newHousehold2, DateTime = as.POSIXct(paste(Date, Time), format = "%Y-%m-%d %H:%M:%OS")) 

plot(newHousehold3$DateTime, newHousehold3$Sub_metering_1, type="n",ylab="Energy sub metering", xlab="")
points(newHousehold3$DateTime, newHousehold3$Sub_metering_1, type="l", col="black")
points(newHousehold3$DateTime, newHousehold3$Sub_metering_2, type="l", col="red")
points(newHousehold3$DateTime, newHousehold3$Sub_metering_3, type="l", col="blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = c(1,1,1))
dev.off()

