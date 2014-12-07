if (file.exists("clean_data/electric_consumption.csv")){
	electric_consumption <- read.csv(data_location)
} else {
	# Use the location of your dataset
	data_location <- "/Users/carlospiad/Desktop/data/household_power_consumption.txt"
	electric_consumption <- read.csv(data_location, sep=";", na.strings="?")
	# Convert characters to Time and Date formats
	electric_consumption$Date <- as.Date(electric_consumption$Date, "%d/%m/%Y")
	electric_consumption$Time <- strptime(electric_consumption$Time, "%T")
	# Subset the data according to dates
	electric_consumption<-subset(electric_consumption, Date >="2007-02-01" & Date <="2007-02-02")
	write.csv(electric_consumption, file = "clean_data/electric_consumption.csv")
}

# Create PNG image with project specifications
png(filename='plots/plot4.png',width=480,height=480,units='px')

# make 4 plots
par(mfrow=c(2,2))

# plot data on first quadrant
plot(electric_consumption$Time,electric_consumption$Global_active_power,ylab='Global Active Power',xlab='',type='l')

# plot data on second quadrant
plot(electric_consumption$Time,electric_consumption$Voltage,xlab='datetime',ylab='Voltage',type='l')

# plot data on third quadrant
lncol<-c('black','red','blue')
lbls<-c('Sub_metering_1','Sub_metering_2','Sub_metering_3')
plot(electric_consumption$Time,electric_consumption$Sub_metering_1,type='l',col=lncol[1],xlab='',ylab='Energy sub metering')
lines(electric_consumption$Time,electric_consumption$Sub_metering_2,col=lncol[2])
lines(electric_consumption$Time,electric_consumption$Sub_metering_3,col=lncol[3])

# plot data on bfourth quadrant
plot(electric_consumption$Time,electric_consumption$Global_reactive_power,xlab='datetime',ylab='Global_reactive_power',type='l')

# Close PNG
x<-dev.off()