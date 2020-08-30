library(data.table)
library(dplyr)

power<-fread("household_power_consumption.txt")
power<-power %>% filter(Date=="1/2/2007"|Date=="2/2/2007")
power$newtime<-paste(power$Date,"T",power$Time,sep="")
png("plot1.png", width=480, height=480, units="px")
hist(as.numeric(power$Global_active_power),
     main="Frequency of Global Active Power (kW)",
     xlab="Global Active Power (kW)",
     xlim=c(0,6),
     ylim=c(0,1400),
     col = "red",
     freq=T
     )
dev.off()

