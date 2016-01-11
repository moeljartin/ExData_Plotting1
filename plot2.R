# read in full data using sqldf
power <- read.table("household_power_consumption.txt", header = TRUE, sep = ";") 
library(dplyr)
power2 <- filter(power, Date == "1/2/2007" | Date == "2/2/2007")
# convert date and time variables
power3 <- power2
power3$Date <- as.Date(power3$Date, "%d/%m/%Y")
power3$Time <- paste(power3$Date, power3$Time)
power3$Time <- strptime(power3$Time, format = "%Y-%m-%d %H:%M:%S")

# global active power trace
png("plot2.png", width = 480, height = 480) 
plot(power3$Time, power3$Global_active_power, type = "l",
     ylab = "Global Active Power (kilowatts)", xlab = "")
dev.off()
