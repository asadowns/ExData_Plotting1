#plot4.R

#get Power Consumption Data
file <- 'household_power_consumption.txt'
powerConsumptionData <- read.csv(file, sep=';')
powerConsumptionData <- subset(powerConsumptionData,
                               powerConsumptionData$Date=='1/2/2007' | powerConsumptionData$Date=='2/2/2007')

#transform power data to numeric
powerConsumptionData <- transform(powerConsumptionData, 
                                  Global_active_power=as.numeric(as.character(Global_active_power)),
                                  Sub_metering_1=as.numeric(as.character(Sub_metering_1)), 
                                  Sub_metering_2=as.numeric(as.character(Sub_metering_2)), 
                                  Sub_metering_3=as.numeric(as.character(Sub_metering_3)),
                                  Voltage=as.numeric(as.character(Voltage)),
                                  Global_reactive_power=as.numeric(as.character(Global_reactive_power)))

#Convert time to single vector for date + time
powerConsumptionData$Time <- strptime(paste(powerConsumptionData$Date,powerConsumptionData$Time),
                                      '%d/%m/%Y %T')

#set graphics device
png(file="plot4.png")

#set parameters
par(mfcol=c(2,2))


#Build top left plot
with(powerConsumptionData,plot(Time,Global_active_power, 
                               type='l', 
                               ylab='Global Active Power', 
                               xlab=''))

#Build bottom left plot
with(powerConsumptionData,plot(Time,Sub_metering_1, 
                               type='n', 
                               ylab='Energy Sub metering', 
                               xlab=''))

#Add Lines to bottom left plot
with(powerConsumptionData,lines(Time,Sub_metering_1))
with(powerConsumptionData,lines(Time,Sub_metering_2, col='red'))
with(powerConsumptionData,lines(Time,Sub_metering_3, col='blue'))

#Add Legend to bottom left plot
legend('topright', lty=1, col=c('black','red','blue'), bty='n',
       legend=c('Sub_metering_1','Sub_metering_2','Sub_metering_3'))

#Build top right plot
with(powerConsumptionData,plot(Time,Voltage, 
                               type='l', 
                               ylab='Voltage', 
                               xlab='datetime'))

#Build bottom right plot
with(powerConsumptionData,plot(Time,Global_reactive_power, 
                               type='l', 
                               xlab='datetime'))

#Shut down graphics device
dev.off()