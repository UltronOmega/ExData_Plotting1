pwrdat<-read.table("exdata-data-household_power_consumption/household_power_consumption.txt", sep = ";", header=TRUE, na.strings= c("?", "NA"))
dates<-pwrdat[pwrdat$Date %in% c("1/2/2007", "2/2/2007"),]

dates$Date <- as.Date(dates$Date, format = "%d/%m/%Y")
dates$DateTime <- strptime(paste(dates$Date, dates$Time), format = "%Y-%m-%d %H:%M:%S")

png("plot3.png", width=480, height=480,bg="white")
par(mfrow=c(1,1))

plot(dates$DateTime, dates$Sub_metering_1,
          type = "l",
          ylab = "Energy sub metering",
          xlab = "")
          
points(dates$DateTime, dates$Sub_metering_2, type = "l", col = "red")
points(dates$DateTime, dates$Sub_metering_3, type = "l", col = "blue")
legend(x = "topright",legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
            col = c("black", "red", "blue"),
            lty = 1) 
dev.off()
