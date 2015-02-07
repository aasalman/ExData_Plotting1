# Load data from text file conained in working directory

raw.data <- read.csv("./Data/household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                     nrows=2075259, comment.char="", quote='\"')

# Extract subset dates for plot

plot.data <- raw.data[raw.data$Date %in% c("1/2/2007","2/2/2007"),]
rm(raw.data)

# Convert into format to show day of week

date.time <- strptime(paste(plot.data$Date, plot.data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

# Compile all data for plotting

GAP <- as.numeric(plot.data$Global_active_power)
GRP <- as.numeric(plot.data$Global_reactive_power)
V <- as.numeric(plot.data$Voltage)
sm1 <- as.numeric(plot.data$Sub_metering_1)
sm2 <- as.numeric(plot.data$Sub_metering_2)
sm3 <- as.numeric(plot.data$Sub_metering_3)

# Plot 4

par(mfrow = c(2,2))

plot(date.time,GAP, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")

plot(date.time,V, type="l",
     ylab="Voltage", xlab="datetime")

plot(date.time,sm1, type="l",
     ylab="Energy Submetering", xlab="")
lines(date.time,sm2,type="l",col="red")
lines(date.time,sm3,type="l",col="blue")
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=1, lwd=2.5, col=c("black","red","blue"))

plot(date.time,GRP, type="l",
     ylab="Global_reactive_power", xlab="datetime")

dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()