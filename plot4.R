png(filename = "plot4.png")
dat<-read.table("household_power_consumption.txt",header = TRUE,sep=";",dec= ".")
dat[1]<-as.Date(dat$Date,format = "%d/%m/%Y")
dat<-subset(dat,Date=="2007-02-01" | Date=="2007-02-02")
date<-strptime(paste(dat$Date,dat$Time),"%Y-%m-%d %H:%M:%S")
dat[3]<-as.numeric(dat[[3]])
dat[4]<-as.numeric(dat[[4]])
dat[5]<-as.numeric(dat[[5]])
dat[7]<-as.numeric(dat[[7]])
dat[8]<-as.numeric(dat[[8]])
dat[9]<-as.numeric(dat[[9]])

par(mfrow = c ( 2, 2) )

#plot 1
  plot(date,dat$Global_active_power,type = "l" , ylab = "Global Active Power (kilowatts)" , xlab = "")

#plot 2 
  plot ( date , dat$Voltage , type = "l" , ylab = "Voltage", xlab = "Datetime")

#plot 3
  plot ( date, dat$Sub_metering_1, type = "l" , ylab = "Energy sub metering" , xlab ="" )
  lines( date, dat$Sub_metering_2, col = "red", type = "l" , ylab = "", xlab = "" )
  lines( date, dat$Sub_metering_3, col = "blue", type = "l" , ylab = "", xlab = "" )
  legend ( "topright", legend = c ( "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, col = c ( "black", "red", "blue" ))
  
#plot 4 

  plot ( date,dat$Global_reactive_power , type = "l" , ylab = "Global Reactive Power", xlab = "Datetime" )
  
dev.off()