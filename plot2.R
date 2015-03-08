#plot2.R

#get Power Consumption Data
file <- 'household_power_consumption.txt'
powerConsumptionData <- read.csv(file, sep=';')
powerConsumptionData <- subset(powerConsumptionData,
                               powerConsumptionData$Date=='1/2/2007' | powerConsumptionData$Date=='2/2/2007')

#transform global active power data to numeric
powerConsumptionData <- transform(powerConsumptionData, 
                                  Global_active_power=as.numeric(as.character(Global_active_power)))

#Convert time to single vector for date + time
powerConsumptionData$Time <- strptime(paste(powerConsumptionData$Date,powerConsumptionData$Time),'%d/%m/%Y %T')

#set graphics device
png(file="plot2.png")

#set margins
#par(mar=c(5,4,4,2))

#Build Plot 2
with(powerConsumptionData,plot(Time,Global_active_power, 
                               type='l', 
                               ylab='Global Active Power (kilowatts)', 
                               xlab=''))

#Shut down graphics device
dev.off()