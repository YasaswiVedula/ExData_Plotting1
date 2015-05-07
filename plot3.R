#Set the working directory
# If dir "data" exists alright, if not download and unzip the given data to a the text file
# Read the text file into R using the following code line
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
# Subsetting data between Feb 1 - Feb 2, 2007
subData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
# Convert the date and time to required format
datetime <- strptime(paste(subData$Date, subData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
# Converting the variables to numeric data
globalActivePower <- as.numeric(subData$Global_active_power)
subMetering1 <- as.numeric(subData$Sub_metering_1)
subMetering2 <- as.numeric(subData$Sub_metering_2)
subMetering3 <- as.numeric(subData$Sub_metering_3)
# Creating PNG file of required aspect ratio
png("plot3.png", width=480, height=480)
# Creates plot with the necessary title,legend,type and axes titles.
plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
# Turning off the PNG device
dev.off()
