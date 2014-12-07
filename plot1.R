# Load the data into R

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

data_location <- "clean_data/electric_consumption.csv"
electric_consumption <- read.csv(data_location)



# Create PNG image with project specifications
png(filename='plots/plot1.png',width=480,height=480,units='px')

#Plot histogram
hist(electric_consumption$Global_active_power,main='Global Active Power',xlab='Global Active Power (kilowatts)',col='red')

# Close PNG
x<-dev.off()

