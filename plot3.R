#plot3.R

#get Power Consumption Data
file <- 'household_power_consumption.txt'
powerConsumptionData <- read.csv(file, sep=';')
powerConsumptionData <- subset(powerConsumptionData,
                               powerConsumptionData$Date=='1/2/2007' | powerConsumptionData$Date=='2/2/2007')

#transform global active power data to numeric
powerConsumptionData <- transform(powerConsumptionData, 
                                  Sub_metering_1=as.numeric(as.character(Sub_metering_1)), 
                                  Sub_metering_2=as.numeric(as.character(Sub_metering_2)), 
                                  Sub_metering_3=as.numeric(as.character(Sub_metering_3)))

#Convert time to single vector for date + time
powerConsumptionData$Time <- strptime(paste(powerConsumptionData$Date,powerConsumptionData$Time),
                                      '%d/%m/%Y %T')

#set graphics device
png(file="plot3.png")

#set margins
#par(mar=c(5,4,4,2))

#Build Plot 3
with(powerConsumptionData,plot(Time,Sub_metering_1, 
                               type='n', 
                               ylab='Energy sub metering', 
                               xlab=''))

#Add Lines to Plot 3
with(powerConsumptionData,lines(Time,Sub_metering_1))
with(powerConsumptionData,lines(Time,Sub_metering_2, col='red'))
with(powerConsumptionData,lines(Time,Sub_metering_3, col='blue'))

#Add Legend to Plot 3
legend('topright', lty=1, col=c('black','red','blue'), 
       legend=c('Sub_metering_1','Sub_metering_2','Sub_metering_3'))

#Shut down graphics device
dev.off()