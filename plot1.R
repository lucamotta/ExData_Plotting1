# load the data
data <- read.csv('household_power_consumption.txt', sep=';', stringsAsFactors=F)
data$DateTime <- as.Date(strptime(paste(data$Date, data$Time), format='%d/%m/%Y %H:%M:%S'))
data$Global_active_power <- as.numeric(data$Global_active_power)

# filter data between 1 and 2 february 2007
startDate <- as.Date("01/02/2007", format='%d/%m/%Y')
endDate <- as.Date("02/02/2007", format='%d/%m/%Y')
feb_data <- data[data$DateTime >= startDate & data$DateTime <= endDate,]

# create histogram and save it to a PNG
png(filename='plot1.png', width=480, height=480)
hist(feb_data$Global_active_power, main="Global Active Power", col="red", xlab="Global Active Power (kilowatts)")
dev.off()
