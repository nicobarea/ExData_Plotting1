furl<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(furl,destfile = "hpc.zip")
unzip("hpc.zip")
hpc<-read.table("household_power_consumption.txt",sep=";")
colnames(hpc)<-c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
hpc2<-subset(hpc,Date=="1/2/2007" | Date=="2/2/2007")
par(mar=c(2,4,2,4))
plot1<-hist(as.numeric(as.character(hpc2$Global_active_power)),
            main="Global Active Power", col="red",xlab="Global Active Power (kilowatts)")
dev.copy(png,file="plot1.png",width=480,height=480)
dev.off()