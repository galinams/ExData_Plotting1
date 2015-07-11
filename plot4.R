data<- read.csv("household_power_consumption.txt", sep=";",stringsAsFactors=FALSE, na.strings="?")
mydata<- subset(data,data$Date=="1/2/2007"|data$Date=="2/2/2007")
time<-hms(mydata$Time)
date_time<-date+time
mydata_new<-cbind(mydata,date_time)

par(mfrow=c(2,2))

plot(mydata_new$date_time,mydata_new$Global_active_power,xlab=" ",ylab="Global Active Power(kilowatts)", type="l")
plot(mydata_new$date_time, mydata_new$Voltage,xlab="datetime",ylab="Voltage",lty="solid",type="l")

plot(mydata_new$date_time,mydata_new$Sub_metering_1, type="l",lty="solid",xlab=" ",ylab="Energy sub metering")
lines(x=mydata_new$date_time,y=mydata_new$Sub_metering_2,col="red")
lines(x=mydata_new$date_time,y=mydata_new$Sub_metering_3,col="blue")
legend("topright", c("Sub_merging_1","Sub_merging_2","Sub_merging_3"),lty="solid",col=c("black","red","blue"),bty="n")
plot(mydata_new$date_time,mydata_new$Global_reactive_power,xlab="datetime",ylab="Global_reactive_power",type="l")

dev.copy(png,file="plot4.png")
dev.off()
