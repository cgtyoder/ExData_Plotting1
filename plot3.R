plot3 <- function()
{
    powuse <- read.csv("../household_power_consumption.txt", header = TRUE, sep = ";", 
                       stringsAsFactors = FALSE, na.strings = c("?"))
    
    powuse <- powuse[powuse$Date == '1/2/2007' | powuse$Date == '2/2/2007', ]
    powuse$datetime <- strptime(paste(powuse$Date, powuse$Time), "%d/%m/%Y %H:%M:%S")
    
    png("plot3.png")
    par(pin = c(5, 3.5), family = "sans")
    plot(powuse$datetime, powuse$Sub_metering_1, 
         ylab = "Energy sub metering", xlab = "", type = "n")
    lines(powuse$datetime, powuse$Sub_metering_1, col = "black")
    lines(powuse$datetime, powuse$Sub_metering_2, col = "red")
    lines(powuse$datetime, powuse$Sub_metering_3, col = "blue")
    legend(x = "topright", names(powuse)[7:9], 
           col = c("black", "red", "blue"), lty = 1)
    dev.off()
}
