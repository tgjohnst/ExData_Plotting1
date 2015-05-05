## plot1.R
## Analysis script for the first project of Coursera Data Science Series, 
## Course 4: Exploratory Data Analysis (exdata-014)
## Timothy Johnstone, May 2015

# Set working directory
# TO RUN THIS SCRIPT please modify the path to reflect your system's file structure
setwd("Z:/Lotus/Dropbox/Coursera/4_Exploratory_Data_Analysis/Projects/ExData_Plotting1")

##########

# Load in dataset file from compressed archive
exdata <- read.table(unz('data/exdata_data_household_power_consumption.zip','household_power_consumption.txt'), 
                     header=T,
                     sep=";", 
                     na.strings="?"
)

# Subset just to the dates we care about
exdata <- exdata[exdata$Date == "2/2/2007" | exdata$Date == "1/2/2007" ,]

# Pre-process date and time columns by combining and POSIX conversion
exdata$dateTime = strptime(paste0(exdata$Date,";",exdata$Time), format="%d/%m/%Y;%H:%M:%S")

##########

# Set up output device and plot
png("plot4.png",480,480)
par(mfrow=c(2,2))

# First line plot
plot(exdata$dateTime, exdata$Global_active_power,
     type='l',
     xlab='',
     ylab='Global Active Power')

# Second line plot
plot(exdata$dateTime, exdata$Voltage,
     type='l',
     xlab='datetime',
     ylab='Voltage')

# Third line plot
plot(exdata$dateTime, exdata$Sub_metering_1, 
     type='l',
     xlab='',
     ylab='Energy sub metering')
lines(exdata$dateTime, exdata$Sub_metering_2, col="2")
lines(exdata$dateTime, exdata$Sub_metering_3, col="4")
legend('topright', lty=c(1,1), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c(1,2,4), bty = 'n')

# Fourth line plot
plot(exdata$dateTime, exdata$Global_reactive_power,
     type='l',
     xlab='datetime',
     ylab='Global_reactive_power')

dev.off()