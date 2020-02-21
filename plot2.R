data_class<-c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric")
data_names<-c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

dataframe<-read.table("household_power_consumption.txt",sep=";",colClasses = data_class,skip=66637,nrows=2880,col.names = data_names)

par(cex=1,cex.lab=0.9)

date<-strptime(paste(dataframe[,"Date"],dataframe[,"Time"]),format = "%d/%m/%Y %H:%M:%S")

png("plot2.png",width = 480,height=480)
plot(date,dataframe$Global_active_power,type="n",xlab = "",ylab="Global Active Power (kilowatts)")
lines(date,dataframe$Global_active_power)
dev.off()