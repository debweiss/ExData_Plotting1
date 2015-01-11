png(file = "plot1.png")
householdPower <- read.table("household_power_consumption.txt", sep = ";", header=TRUE, stringsAsFactors = FALSE)
householdPowerSubset <- as.data.table(householdPower)
newHousehold <- mutate(householdPowerSubset, Date = as.Date(dmy(Date)))
newHousehold2 <- filter(newHousehold, Date == "2007-02-01" | Date == "2007-02-02")

par(mar = c(4,4,2,1))
hist(as.numeric(newHousehold2$Global_active_power), col="red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency")
dev.off()
