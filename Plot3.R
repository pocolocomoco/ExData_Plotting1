######################
# Initial subsetting #
######################

file<-"household_power_consumption.txt"
EPC<-read.table(file,header=TRUE,sep=";",stringsAsFactors = FALSE,dec=".")
plotdata<-EPC[EPC$Date %in% c('1/2/2007', '2/2/2007'),]

######################
# Plot 3 Creation    #
######################

#getting dates into "xable" format
datestringraw<-paste(plotdata$Date, plotdata$Time, sep=" ")
datestamp<-strptime(datestringraw, "%d/%m/%Y %H:%M:%S")

#y axis data
Sub_metering_1<- as.numeric(plotdata$Sub_metering_1)
Sub_metering_2<- as.numeric(plotdata$Sub_metering_2)
Sub_metering_3<- as.numeric(plotdata$Sub_metering_3)

#saving and plotting
png("plot3.png", width=480, height=480)
plot(datestamp,Sub_metering_1,"l",ylab="Energy sub metering")
lines(datestamp,Sub_metering_2,type="l",col="red")
lines(datestamp,Sub_metering_3,type="l",col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"),lty=1,lwd=3,col=c("black", "red", "blue")) 
dev.off()