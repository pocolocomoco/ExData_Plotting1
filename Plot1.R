######################
# Initial subsetting #
######################

file<-"household_power_consumption.txt"
EPC<-read.table(file,header=TRUE,sep=";",stringsAsFactors = FALSE,dec=".")
plotdata<-EPC[EPC$Date %in% c('1/2/2007', '2/2/2007'),]

######################
# Plot 1 Creation    #
######################

GAP<- as.numeric(plotdata$Global_active_power)
png("plot1.png", width=480, height=480)
hist(GAP, col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")
dev.off()