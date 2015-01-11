png(file = "plot2.png")
householdPower <- read.table("household_power_consumption.txt", sep = ";", header=TRUE, stringsAsFactors = FALSE)
householdPowerSubset <- as.data.table(householdPower)
newHousehold <- mutate(householdPowerSubset, Date = as.Date(dmy(Date)))
newHousehold2 <- filter(newHousehold, Date == "2007-02-01" | Date == "2007-02-02")
newHousehold3 <- select(newHousehold2, Date, Time, Global_active_power)
newHousehold4 <- mutate(newHousehold3, DateTime = as.POSIXct(paste(Date, Time), format = "%Y-%m-%d %H:%M:%OS")) 

par(mar = c(4,4,2,1))
plot(newHousehold4$DateTime, as.numeric(newHousehold4$Global_active_power), "l", xlab = "", ylab ="Global Active Power (kilowatts)")
dev.off()

