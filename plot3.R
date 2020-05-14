power_consumption <- read.table("rprj/ExplorDataAnalysis/household_power_consumption.txt", sep = ';', header=TRUE, na.strings='?')
power_consumption$Date <- as.Date( as.character(power_consumption$Date), "%d/%m/%Y")

power_subset <- subset(power_consumption, Date==as.Date("2007-02-01") | Date==as.Date("2007-02-02"))

png(filename="plot3.png")

power_subset$Date <- as.Date(power_subset$Date, format="%d/%m/%Y")
power_subset$timestamp <- as.POSIXct(paste(as.Date(power_subset$Date), power_subset$Time))

with(power_subset, plot(Sub_metering_1~timestamp, type='l', ylab="Energy sub metering", xlab=""))
lines(power_subset$Sub_metering_2~power_subset$timestamp, col="red") 
lines(power_subset$Sub_metering_3~power_subset$timestamp, col="blue")
legend("topright", lty=c(1, 1, 1), col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()
