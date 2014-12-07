# Load the data into R
data_location <- "clean_data/electric_consumption.csv"

electric_consumption <- read.csv(data_location)




# Create PNG image with project specifications
png(filename='plots/plot2.png',width=480,height=480,units='px')

#Plot histogram
plot(electric_consumption$Time,electric_consumption$Global_active_power,ylab='Global Active Power (kilowatts)', xlab='', type='l')

# Close PNG
x<-dev.off()