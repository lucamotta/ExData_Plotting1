# load the data
data <- read.csv('household_power_consumption.txt', sep=';', stringsAsFactors=F)
data$DateTime <- as.Date(strptime(paste(data$Date, data$Time), format='%d/%m/%Y %H:%M:%S'))
data$Global_active_power <- as.numeric(data$Global_active_power)

# filter data between 1 and 2 february 2007
startDate <- as.Date("01/02/2007", format='%d/%m/%Y')
endDate <- as.Date("02/02/2007", format='%d/%m/%Y')
feb_data <- data[data$DateTime >= startDate & data$DateTime <= endDate,]

# convert back date & time with to-the-second precision
feb_data$DateTime <- strptime(paste(feb_data$Date, feb_data$Time), format='%d/%m/%Y %H:%M:%S')

# create plot and save it to a PNG
png(filename="plot2.png", width=480, height=480)
plot(feb_data$DateTime, feb_data$Global_active_power, type='l', xlab="", ylab="Global Active Power (kilowatts)")
dev.off()

