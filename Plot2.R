######################
# Initial subsetting #
######################

file<-"household_power_consumption.txt"
EPC<-read.table(file,header=TRUE,sep=";",stringsAsFactors = FALSE,dec=".")
plotdata<-EPC[EPC$Date %in% c('1/2/2007', '2/2/2007'),]

######################
# Plot 2 Creation    #
######################

#getting dates into "xable" format
datestringraw<-paste(plotdata$Date, plotdata$Time, sep=" ")
datestamp<-strptime(datestringraw, "%d/%m/%Y %H:%M:%S")

#yaxis data
GAP<- as.numeric(plotdata$Global_active_power)

#saving and plotting
png("plot2.png", width=480, height=480)
plot(datestamp,GAP,"l",ylab="Global Active Power (kilowatts)")
dev.off()