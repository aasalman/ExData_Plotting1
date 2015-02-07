# Load data from text file conained in working directory

raw.data <- read.csv("./Data/household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                     nrows=2075259, comment.char="", quote='\"')

# Extract subset dates for plot

plot.data <- raw.data[raw.data$Date %in% c("1/2/2007","2/2/2007"),]
rm(raw.data)

# Convert into format to show day of week

date.time <- strptime(paste(plot.data$Date, plot.data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

# Compile global active power data for plotting

GAP <- as.numeric(plot.data$Global_active_power)

# Plot 2

plot(date.time,GAP, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()