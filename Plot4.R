######################
# Initial subsetting #
######################

file<-"household_power_consumption.txt"
EPC<-read.table(file,header=TRUE,sep=";",stringsAsFactors = FALSE,dec=".")
plotdata<-EPC[EPC$Date %in% c('1/2/2007', '2/2/2007'),]

######################
# Plot 4 Creation    #
######################

#getting dates into "xable" format
datestringraw<-paste(plotdata$Date, plotdata$Time, sep=" ")
datestamp<-strptime(datestringraw, "%d/%m/%Y %H:%M:%S")

#y axis data
GAP<- as.numeric(plotdata$Global_active_power)
V<- as.numeric(plotdata$Voltage)
Sub_metering_1<- as.numeric(plotdata$Sub_metering_1)
Sub_metering_2<- as.numeric(plotdata$Sub_metering_2)
Sub_metering_3<- as.numeric(plotdata$Sub_metering_3)
GRP<- as.numeric(plotdata$Global_reactive_power)

#saving and plotting
png("plot4.png", width=480, height=480)

#create space for the multiple plots
par(mfrow=c(2,2))

#top left plot(1,1)
plot(datestamp,GAP,"l",ylab="Global Active Power (kilowatts)")

#top right plot(1,2)
plot(datestamp,V,"l",ylab="Voltage",xlab="datetime")

#bottom left plot(2,1)
plot(datestamp,Sub_metering_1,"l",ylab="Energy sub metering")
lines(datestamp,Sub_metering_2,type="l",col="red")
lines(datestamp,Sub_metering_3,type="l",col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"),lty=1,lwd=3,col=c("black", "red", "blue")) 

#bottom right plot(2,2)
plot(datestamp,GRP,"l",ylab="Global_reactive_Power",xlab="datetime")

dev.off()