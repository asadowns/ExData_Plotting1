#plot1.R
#get Power Consumption Data
file <- 'household_power_consumption.txt'
powerConsumptionData <- read.csv(file, sep=';', stringsAsFactors=F)
powerConsumptionData <- subset(powerConsumptionData,
                               powerConsumptionData$Date=='1/2/2007' | powerConsumptionData$Date=='2/2/2007')

#set graphics device
png(file="plot1.png")

#Build Histogram
hist(as.numeric(powerConsumptionData$Global_active_power), 
     main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", 
     col="red")

#Shut down graphics device
dev.off()