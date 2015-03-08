#plot1.R
#get Power Consumption Data
file <- 'household_power_consumption.txt'
powerConsumptionData <- read.csv(file, sep=';')
powerConsumptionData <- subset(powerConsumptionData,
                               powerConsumptionData$Date=='1/2/2007' | powerConsumptionData$Date=='2/2/2007')

#transform global active power data to numeric
powerConsumptionData <- transform(powerConsumptionData, 
                                  Global_active_power=as.numeric(as.character(Global_active_power)))

#set graphics device
png(file="plot1.png")

#set margins
#par(mar=c(5,4,3,2))

#Build Histogram
hist(as.numeric(powerConsumptionData$Global_active_power), 
     main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", 
     col="red")

#Shut down graphics device
dev.off()