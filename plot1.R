#downloaded and extracted data folder "exdata-data-household_power_consumption" must be in r directory
#the graph will be generated in r directory 

pwrdat<-read.table("exdata-data-household_power_consumption/household_power_consumption.txt", sep = ";", header=TRUE, na.strings= c("?", "NA"))

dates<-pwrdat[pwrdat$Date %in% c("1/2/2007", "2/2/2007"),]


png("plot1.png", width=480, height=480, bg="white")
par(mfrow=c(1,1))
hist(dates$Global_active_power,
      main = "Global Active Power",
      xlab = "Global Active Power (kilowatts)",
      col = "red")
dev.off()
