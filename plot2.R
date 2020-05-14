power_consumption <- read.table("rprj/ExplorDataAnalysis/household_power_consumption.txt", sep = ';', header=TRUE, na.strings='?', nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
power_consumption$Date <- as.Date( as.character(power_consumption$Date), "%d/%m/%Y")

power_subset <- subset(power_consumption, Date==as.Date("2007-02-01") | Date==as.Date("2007-02-02"))

power_subset$Date <- as.Date(power_subset$Date, format="%d/%m/%Y")

power_subset$timestamp <- as.POSIXct(paste(as.Date(power_subset$Date), power_subset$Time))
png(filename="plot2.png")
with(power_subset, plot(Global_active_power~timestamp, type='l', ylab="Global Active Power (kilowatts)", xlab=""))
dev.off()
