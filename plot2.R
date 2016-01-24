

pwrdat<-read.table("exdata-data-household_power_consumption/household_power_consumption.txt", sep = ";", header=TRUE, na.strings= c("?", "NA"))

dates<-pwrdat[pwrdat$Date %in% c("1/2/2007", "2/2/2007"),]

dates$Date <- as.Date(dates$Date, format = "%d/%m/%Y")
dates$DateTime <- strptime(paste(dates$Date, dates$Time), format = "%Y-%m-%d %H:%M:%S")

png("plot2.png", width=480, height=480, bg="white")
par(mfrow=c(1,1))
plot(dates$DateTime, dates$Global_active_power,
      type = "l",
      ylab = "Global Active Power (kilowatts)",
      xlab = ""
 )
dev.off() 
