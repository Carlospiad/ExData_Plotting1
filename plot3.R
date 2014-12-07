# Load the data into R
data_location <- "clean_data/electric_consumption.csv"

electric_consumption <- read.csv(data_location)




# Create PNG image with project specifications
png(filename='plots/plot3.png',width=480,height=480,units='px')

# plot data
lncol<-c('black','red','blue')
lbls<-c('Sub_metering_1','Sub_metering_2','Sub_metering_3')
plot(electric_consumption$Time,electric_consumption$Sub_metering_1,type='l',col=lncol[1],xlab='',ylab='Energy sub metering')
lines(electric_consumption$Time,electric_consumption$Sub_metering_2,col=lncol[2])
lines(electric_consumption$Time,electric_consumption$Sub_metering_3,col=lncol[3])

# add legend
legend('topright',legend=lbls,col=lncol,lty='solid')

# Close PNG
x<-dev.off()