data<- read.csv("household_power_consumption.txt", sep=";",stringsAsFactors=FALSE, na.strings="?")
mydata<- subset(data,data$Date=="1/2/2007"|data$Date=="2/2/2007")
time<-hms(mydata$Time)
date_time<-date+time
mydata_new<-cbind(mydata,date_time)

plot(mydata_new$date_time,mydata_new$Sub_metering_1, type="l",lty="solid",xlab=" ",ylab="Energy sub metering")
lines(x=mydata_new$date_time,y=mydata_new$Sub_metering_2,col="red")
lines(x=mydata_new$date_time,y=mydata_new$Sub_metering_3,col="blue")
legend("topright", c("Sub_merging_1","Sub_merging_2","Sub_merging_3"),lty="solid",col=c("black","red","blue"))
dev.copy(png,file="plot3.png")
dev.off()
