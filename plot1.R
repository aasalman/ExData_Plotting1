# Load data from text file conained in working directory

raw.data <- read.csv("./Data/household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                     nrows=2075259, comment.char="", quote='\"')

# Extract subset dates for plot

plot.data <- raw.data[raw.data$Date %in% c("1/2/2007","2/2/2007"),]
rm(raw.data)

## Plot 1
hist(plot.data$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

## Saving to file
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()