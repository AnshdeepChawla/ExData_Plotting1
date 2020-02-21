data_class<-c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric")
data_names<-c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

dataframe<-read.table("household_power_consumption.txt",sep=";",colClasses = data_class,skip=66637,nrows=2880,col.names = data_names)
par(cex=1,cex.lab=0.9)

date<-strptime(paste(dataframe[,"Date"],dataframe[,"Time"]),format = "%d/%m/%Y %H:%M:%S")

png("plot3.png",width = 480,height=480)
plot(date,dataframe$Sub_metering_1,type="n",xlab = "",ylab = "Energy sub metering")
lines(date,dataframe$Sub_metering_1)
lines(date,dataframe$Sub_metering_2,col="red")
lines(date,dataframe$Sub_metering_3,col="blue")

legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=1,cex=0.8)
dev.off()