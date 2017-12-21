plot2 <- function()
{
    powuse <- read.csv("../household_power_consumption.txt", header = TRUE, sep = ";", 
                       stringsAsFactors = FALSE, na.strings = c("?"))
    
    powuse <- powuse[powuse$Date == '1/2/2007' | powuse$Date == '2/2/2007', ]
    powuse$datetime <- strptime(paste(powuse$Date, powuse$Time), "%d/%m/%Y %H:%M:%S")
    
    png("plot2.png")
    par(pin = c(5, 3.5), family = "sans")
    plot(powuse$datetime, powuse$Global_active_power, 
         ylab = "Global Active Power (kilowats)", xlab = "", type = "n")
    lines(powuse$datetime, powuse$Global_active_power)
    dev.off()
}
