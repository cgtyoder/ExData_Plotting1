plot1 <- function()
{
    powuse <- read.csv("../household_power_consumption.txt", header = TRUE, sep = ";", 
                       stringsAsFactors = FALSE, na.strings = c("?"))
    
    powuse <- powuse[powuse$Date == '1/2/2007' | powuse$Date == '2/2/2007', ]
    powuse$datetime <- strptime(paste(powuse$Date, powuse$Time), "%d/%m/%Y %H:%M:%S")
    
    png("plot1.png")
    par(pin = c(5, 3.5), family = "sans")
    hist(t2$Global_active_power, col = "red", ylab = "Frequency", 
         xlab = "Global Active Power (kilowats)", main = "Global Active Power")
    dev.off()
}
