#Set the working directory
# If dir "data" exists alright, if not download and unzip the given data to a the text file
# Read the text file into R using the following code line
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
# Subsetting data between Feb 1 - Feb 2, 2007
subData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
# Convert the date and time to required format
datetime <- strptime(paste(subData$Date, subData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(subData$Global_active_power)
# Creating PNG file of required aspect ratio
png("plot2.png", width=480, height=480)
# Creates plot with the necessary title,type and axes titles.
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
# Turning off the PNG device
dev.off()