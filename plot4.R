furl<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(furl,destfile = "hpc.zip")
unzip("hpc.zip")
hpc<-read.table("household_power_consumption.txt",sep=";")
hpc2<-subset(hpc,V1=="1/2/2007" | V1=="2/2/2007")
hpc2<-cbind(c(1:2880),hpc2)
colnames(hpc2)<-c("num","Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

png(file="plot4.png",width=480,height=480)
par(mfrow=c(2,2))

plot2<-plot(hpc2$num,as.numeric(as.character(hpc2$Global_active_power)),type="l",
            xlab="",ylab="Global Active Power",xaxt='n')
axis(1,at=c(0,1450,2900), labels = c("Thu","Fri","Sat"))

plot4<-plot(hpc2$num,as.numeric(as.character(hpc2$Voltage)),type="l",
            xlab="datetime",ylab="Voltage",xaxt='n')
axis(1,at=c(0,1450,2900), labels = c("Thu","Fri","Sat"))

plot3<-plot(hpc2$num,as.numeric(as.character(hpc2$Sub_metering_1)),type="l",col="black",
            xlab="",ylab="Energy sub metering",xaxt='n')
lines(hpc2$num,as.numeric(as.character(hpc2$Sub_metering_2)),type="l",col="red")
lines(hpc2$num,as.numeric(as.character(hpc2$Sub_metering_3)),type="l",col="blue")
axis(1,at=c(0,1450,2900), labels = c("Thu","Fri","Sat"))
legend("topright",bty="n",lwd=c(2,2,2),col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

plot5<-plot(hpc2$num,as.numeric(as.character(hpc2$Global_reactive_power)),type="l",
            xlab="datetime",ylab="Global_reactive_power",xaxt='n')
axis(1,at=c(0,1450,2900), labels = c("Thu","Fri","Sat"))

dev.off()