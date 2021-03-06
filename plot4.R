library(data.table)
library(dplyr)


power<-fread("household_power_consumption.txt")
power<-power %>% filter(Date=="1/2/2007"|Date=="2/2/2007")
power$newtime<-paste(power$Date,"T",power$Time,sep="")

newtime<-strptime(power$newtime,format="%d/%m/%YT%H:%M:%S")
#4 plots on 1 graphics device
png("plot4.png", width=480, height=480, units="px")
plots<-par(mfrow=c(2,2))


#Global Active power
plot(newtime,power$Global_active_power, 
     pch=NA,
     ylab="Global Active Power (kW)", xlab="Day")

lines(newtime,power$Global_active_power)


# Voltage
plot(newtime, power$Voltage, pch=NA, ylab = "Voltage", xlab = "datetime")
lines(newtime, power$Voltage)


#Sub meters
#Sub metering 1
plot(newtime,power$Sub_metering_1, 
     pch=NA,
     ylab="Energy sub-metering", xlab="Day")
lines(newtime,power$Sub_metering_1)
#Sub metering 2
points(newtime,power$Sub_metering_2, pch=NA)
lines(newtime, power$Sub_metering_2, col="red")
#Sub metering 3
points(newtime,power$Sub_metering_3, pch=NA)
lines(newtime, power$Sub_metering_3, col="blue")

legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black","red","blue"),lty=c(1,1,1))


# Global Reactive Power
plot(newtime, power$Global_reactive_power, pch=NA, 
     ylab = "Global reactive power", xlab = "datetime")
lines(newtime, power$Global_reactive_power)

dev.off()