#plot3.R

#get Power Consumption Data
file <- 'household_power_consumption.txt'
powerConsumptionData <- read.csv(file, sep=';', stringsAsFactors=F)
powerConsumptionData <- subset(powerConsumptionData,
                               powerConsumptionData$Date=='1/2/2007' | powerConsumptionData$Date=='2/2/2007')

#Convert time to single vector for date + time
powerConsumptionData$DateTime <- strptime(paste(powerConsumptionData$Date,powerConsumptionData$Time),
                                      '%d/%m/%Y %T')

#set graphics device
png(file="plot3.png")

#Build Plot 3
with(powerConsumptionData,plot(DateTime,Sub_metering_1, 
                               type='n', 
                               ylab='Energy sub metering', 
                               xlab=''))

#Add Lines to Plot 3
with(powerConsumptionData,lines(DateTime,Sub_metering_1))
with(powerConsumptionData,lines(DateTime,Sub_metering_2, col='red'))
with(powerConsumptionData,lines(DateTime,Sub_metering_3, col='blue'))

#Add Legend to Plot 3
legend('topright', lty=1, col=c('black','red','blue'), 
       legend=c('Sub_metering_1','Sub_metering_2','Sub_metering_3'))

#Shut down graphics device
dev.off()