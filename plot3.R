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
png(filename="plot3.png", width=480, height=480)
plot(feb_data$DateTime, feb_data$Sub_metering_2, type='n', xlab="", ylab="Energy sub metering", ylim=c(as.integer(min(feb_data$Sub_metering_1, feb_data$Sub_metering_2, feb_data$Sub_metering_3)), as.integer(max(feb_data$Sub_metering_1, feb_data$Sub_metering_2, feb_data$Sub_metering_3))))
with(feb_data, points(DateTime, Sub_metering_1, type='l'))
with(feb_data, points(DateTime, Sub_metering_2, type='l', col='red'))
with(feb_data, points(DateTime, Sub_metering_3, type='l', col='blue'))
legend('topright', lwd=1, legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"))
dev.off()

