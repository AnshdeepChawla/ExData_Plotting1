data_class<-c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric")
data_names<-c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
  
dataframe<-read.table("household_power_consumption.txt",sep=";",colClasses = data_class,skip=66637,nrows=2880,col.names = data_names)
png("plot4.png",width = 480,height=480)
par(cex=1,cex.lab=0.7)
par(mfrow=c(2,2),lwd=1.2)

date<-strptime(paste(dataframe[,"Date"],dataframe[,"Time"]),format = "%d/%m/%Y %H:%M:%S")


plot(date,dataframe$Global_active_power,type="n",xlab = "",ylab="Global Active Power (kilowatts)")
lines(date,dataframe$Global_active_power)

plot(date,dataframe$Voltage,type="n",xlab = "datetime",ylab="Voltage")
lines(date,dataframe$Voltage)

plot(date,dataframe$Sub_metering_1,type="n",xlab = "",ylab = "Energy sub metering")
lines(date,dataframe$Sub_metering_1)
lines(date,dataframe$Sub_metering_2,col="red")
lines(date,dataframe$Sub_metering_3,col="blue")

legend(date[1580],39,legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=1,cex=0.5,box.lty = 0)

plot(date,dataframe$Global_reactive_power,type="n",xlab = "datetime",ylab="Global_reactive_power")
lines(date,dataframe$Global_reactive_power)

dev.off()