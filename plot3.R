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
## generate weekdays
png("plot3.png", width = 480, height = 480) 
plot(power3$Time, as.numeric(as.character(power3$Sub_metering_1)), type = "l",
     ylab = "Energy sub metering", xlab = "")
lines(power3$Time, as.numeric(as.character(power3$Sub_metering_2)), col = "red")
lines(power3$Time, as.numeric(as.character(power3$Sub_metering_3)), col = "blue")
legend('topright', c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty = c(1,1,1), col = c("black", "red", "blue"))
dev.off()
