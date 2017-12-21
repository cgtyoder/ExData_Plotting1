plot4 <- function()
{
    powuse <- read.csv("../household_power_consumption.txt", header = TRUE, sep = ";", 
                       stringsAsFactors = FALSE, na.strings = c("?"))
    
    powuse <- powuse[powuse$Date == '1/2/2007' | powuse$Date == '2/2/2007', ]
    powuse$datetime <- strptime(paste(powuse$Date, powuse$Time), "%d/%m/%Y %H:%M:%S")
    
    png("plot4.png")
    par(family = "sans", mfrow = c(2, 2))
    
    # orig plot2
    plot(powuse$datetime, powuse$Global_active_power, 
         ylab = "Global Active Power (kilowats)", xlab = "", type = "n")
    lines(powuse$datetime, powuse$Global_active_power)
    
    # new plot 1
    plot(powuse$datetime, powuse$Voltage, ylab = "Voltage", xlab = "datetime", type = "n")
    lines(powuse$datetime, powuse$Voltage)
    
    # orig plot3
    plot(powuse$datetime, powuse$Sub_metering_1, 
         ylab = "Energy sub metering", xlab = "", type = "n")
    lines(powuse$datetime, powuse$Sub_metering_1, col = "black")
    lines(powuse$datetime, powuse$Sub_metering_2, col = "red")
    lines(powuse$datetime, powuse$Sub_metering_3, col = "blue")
    legend(x = "topright", names(powuse)[7:9], 
           col = c("black", "red", "blue"), lty = 1)

    # new plot 2
    plot(powuse$datetime, powuse$Global_reactive_power, 
         ylab = "Global_reactive_power", xlab = "datetime", type = "n")
    lines(powuse$datetime, powuse$Global_reactive_power)
    
    dev.off()
}
