#Set the working directory
# If dir "data" exists alright, if not download and unzip the given data to a the text file
# Read the text file into R using the following code line
data <- read.table("household_power_consumption.txt", sep=";", header=TRUE, stringsAsFactors=FALSE, dec=".")
# Check if the variable names are same as given in the text file
names(data)
# Subsetting data between Feb 1 - Feb 2, 2007
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
# Converting the data on X-axis to numeric class
globalActivePower <- as.numeric(subSetData$Global_active_power)
# Creating PNG file of required aspect ratio
png("plot1.png", width=480, height=480)
# Creates plot with the necessary title, axes and color
hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
# Turning off the PNG device
dev.off()