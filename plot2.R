furl<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(furl,destfile = "hpc.zip")
unzip("hpc.zip")
hpc<-read.table("household_power_consumption.txt",sep=";")
hpc2<-subset(hpc,V1=="1/2/2007" | V1=="2/2/2007")
hpc2<-cbind(c(1:2880),hpc2)
colnames(hpc2)<-c("num","Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
plot2<-plot(hpc2$num,as.numeric(as.character(hpc2$Global_active_power)),type="l",
            xlab="",ylab="Global Active Power (kilowatts)",xaxt='n')
axis(1,at=c(0,1450,2900), labels = c("Thu","Fri","Sat"))
dev.copy(png,file="plot2.png",width=480,height=480)
dev.off()