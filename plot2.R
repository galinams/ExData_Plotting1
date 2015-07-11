data<- read.csv("household_power_consumption.txt", sep=";",stringsAsFactors=FALSE, na.strings="?")
mydata<- subset(data,data$Date=="1/2/2007"|data$Date=="2/2/2007")
time<-hms(mydata$Time)
date_time<-date+time
mydata_new<-cbind(mydata,date_time)
plot(mydata_new$date_time,mydata_new$Global_active_power,xlab=" ",ylab="Global Active Power(kilowatts)", type="l")
dev.copy(png,file="plot2.png")
dev.off()
