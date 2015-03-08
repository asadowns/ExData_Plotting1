#plot2.R

#get Power Consumption Data
file <- 'household_power_consumption.txt'
powerConsumptionData <- read.csv(file, sep=';', stringsAsFactors=F)
powerConsumptionData <- subset(powerConsumptionData,
                               powerConsumptionData$Date=='1/2/2007' | powerConsumptionData$Date=='2/2/2007')

#Convert time to single vector for date + time
powerConsumptionData$DateTime <- strptime(paste(powerConsumptionData$Date,powerConsumptionData$Time),'%d/%m/%Y %T')

#set graphics device
png(file="plot2.png")

#Build Plot 2
with(powerConsumptionData,plot(DateTime,Global_active_power, 
                               type='l', 
                               ylab='Global Active Power (kilowatts)', 
                               xlab=''))

#Shut down graphics device
dev.off()