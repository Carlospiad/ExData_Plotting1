# Load the data into R

if (file.exists("clean_data/electric_consumption.csv")){
	data_location <- "clean_data/electric_consumption.csv"
	electric_consumption <- read.csv(data_location)
} else {
	# Use the location of your dataset
	data_location <- "/Users/carlospiad/Desktop/data/household_power_consumption.txt"
	electric_consumption <- read.csv(data_location, sep=";", na.strings="?")
	# Convert Date to correcto format
	electric_consumption$Date <- as.Date(electric_consumption$Date, "%d/%m/%Y")
	# Subset the data according to dates
	electric_consumption<-subset(electric_consumption, Date >="2007-02-01" & Date <="2007-02-02")
	write.csv(electric_consumption, file = "clean_data/electric_consumption.csv")
}

data_location <- "clean_data/electric_consumption.csv"
electric_consumption <- read.csv(data_location)

electric_consumption <- transform(electric_consumption,DateTime=paste(Date,Time,sep=" "))
electric_consumption$DateTime <- strptime(electric_consumption$DateTime, "%F %T")

# Create PNG image with project specifications
png(filename='plots/plot3.png',width=480,height=480,units='px')

# plot data
lncol<-c('black','red','blue')
lbls<-c('Sub_metering_1','Sub_metering_2','Sub_metering_3')
plot(electric_consumption$DateTime,electric_consumption$Sub_metering_1,type='l',col=lncol[1],xlab='',ylab='Energy sub metering')
lines(electric_consumption$DateTime,electric_consumption$Sub_metering_2,col=lncol[2])
lines(electric_consumption$DateTime,electric_consumption$Sub_metering_3,col=lncol[3])

# add legend
legend('topright',legend=lbls,col=lncol,lty='solid')

# Close PNG
x<-dev.off()