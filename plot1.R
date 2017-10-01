# Exploratory Data Analysis
# project 1: Global active power histogram (plot1.png)

## load the  Electric power consumption dataset

dataset <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                    nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="",quote='\"')

# Subset the date data in a time frame between "2007-02-01" and "2007-02-02"

data <- subset(dataset, Date %in% c("1/2/2007","2/2/2007"))

# Plot a histogram

hist(data$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", 
     ylab="Frequency", col="Red")

# Save histogram to a png file with specific features (height and width)

dev.copy(png,file="plot1.png", height = 480, width = 480)

# Close the graphic device
dev.off()
