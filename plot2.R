library(data.table)
library(dplyr)


power<-fread("household_power_consumption.txt")
power<-power %>% filter(Date=="1/2/2007"|Date=="2/2/2007")
power$newtime<-paste(power$Date,"T",power$Time,sep="")

png("plot2.png", width=480, height=480, units="px")
plot(strptime(power$newtime,format="%d/%m/%YT%H:%M:%S"),power$Global_active_power, 
     pch=NA,
     ylab="Global Active Power (kW)", xlab="Day")

lines(strptime(power$newtime,format="%d/%m/%YT%H:%M:%S"),power$Global_active_power)
dev.off()