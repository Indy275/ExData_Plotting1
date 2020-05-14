power_consumption <- read.table("rprj/ExplorDataAnalysis/household_power_consumption.txt", sep = ';', header=TRUE, na.strings='?')
power_consumption$Date <- as.Date( as.character(power_consumption$Date), "%d/%m/%Y")

power_subset <- subset(power_consumption, Date==as.Date("2007-02-01") | Date==as.Date("2007-02-02"))

png(filename="plot1.png")
with(power_subset, hist(x=Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)"))
dev.off()
