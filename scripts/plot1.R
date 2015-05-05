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

# Pre-process dataset columns
exdata$Date = as.Date(exdata$Date,format = '%d/%m/%Y')
exdata$Time = strptime(exdata$Time, format="%H:%M:%S" )


##########