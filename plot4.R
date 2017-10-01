# Exploratory Data Analysis
# project 1: multiple graphs in a single plot (plot4.png)

#Change lables from Spanish to English language
Sys.setlocale("LC_ALL","English")

## load the  Electric power consumption dataset

dataset <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                    nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="",quote='\"')

# Subset the date data in a time frame between "2007-02-01" and "2007-02-02"

data <- subset(dataset, Date %in% c("1/2/2007","2/2/2007"))

#Transform Date attribute to a standard datetime in R

data$Date <- as.Date(data$Date, format="%d/%m/%Y")

# Concatenate date and time
datetime <- paste(as.Date(data$Date), data$Time)

#Class "POSIXct" represents the (signed) number of seconds since the beginning of 1970 (in the UTC time zone) 

data$Datetime <- as.POSIXct(datetime)

# Create multiple line plots

par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(data, {
  plot(Global_active_power~Datetime, type="l", ylab="Global Active Power (kilowatts)", xlab="")
  plot(Voltage~Datetime, type="l", ylab="Voltage (volt)", xlab="")
  plot(Sub_metering_1~Datetime, type="l", ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
  legend("topright", col=c("black", "red", "blue"), lty=c(1,1,1),lwd=c(2,2,2) , 
  legend=c("SubMetering1", "SubMetering2", "SubMetering3"),y.intersp=0.4,x.intersp=0.2,
  cex=0.5,bty = "n")
  plot(Global_reactive_power~Datetime, type="l", 
       ylab="Global Rective Power (kilowatts)",xlab="")
})

# Save line plot to a png file with specific features (height and width)

dev.copy(png,file="plot4.png", height = 480, width = 480)

# Close the graphic device
dev.off()
