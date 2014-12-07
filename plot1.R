# Load the data into R
data_location <- "clean_data/electric_consumption.csv"
electric_consumption <- read.csv(data_location)



# Create PNG image with project specifications
png(filename='plots/plot1.png',width=480,height=480,units='px')

#Plot histogram
hist(electric_consumption$Global_active_power,main='Global Active Power',xlab='Global Active Power (kilowatts)',col='red')

# Close PNG
x<-dev.off()

