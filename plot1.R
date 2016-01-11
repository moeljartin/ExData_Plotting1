# read in full data using sqldf
power <- read.table("household_power_consumption.txt", header = TRUE, sep = ";") 
library(dplyr)
power2 <- filter(power, Date == "1/2/2007" | Date == "2/2/2007")
# convert date and time variables
power3 <- power2
power3$Date <- as.Date(power3$Date, "%d/%m/%Y")
power3$Time <- paste(power3$Date, power3$Time)
power3$Time <- strptime(power3$Time, format = "%Y-%m-%d %H:%M:%S")

# global active power histogram
hist(as.numeric(power3$Global_active_power), col = "red")
gap <- as.numeric(as.character(power3$Global_active_power))
hist(gap, col = "red", xlab = "Global Active Power (kilowatts)", 
     main = "Global Active Power")
png("plot1.png", width = 480, height = 480) 
hist(gap, col = "red", xlab = "Global Active Power (kilowatts)", 
     main = "Global Active Power")
dev.off()
