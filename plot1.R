# Peer-graded assignment Week 1 Cousera Data science Specialisation Cours 4: Explanatory Analysis 
# script for plot 1 by Emeline Mourocq

# to set the directory
setwd("C:/Users/EmelineMourocq/Documents/Giving Life to Data Project/COURS/Coursera-Data Science Specialization/Cours 4 - Exploratory Data Analysis/Week 1/Peer-graded Assignment Course Project 1")

# Data Loading
hpcData <-read.csv("household_power_consumption.txt",sep=";",header=T)
head(hpcData)
str(hpcData)

# Data subsetting
hpcDataSubset<-subset(hpcData,Date==c("1/2/2007","2/2/2007"))

# convert variable of interest to numeric
hpcDataSubset$Global_active_power<-as.numeric(as.character(hpcDataSubset$Global_active_power))
str(hpcDataSubset) # verification

# Construct the plot and save it to a PNG file with a width of 480 pixels and a height of 480 pixels.
png(file = "plot1.png") ## Open PNG device; create 'plot1.png' in my working directory

with(hpcDataSubset,hist(Global_active_power, main="Global Active Power",
                        xlab="Global Active Power (kilowatts)", col="red"))
dev.off() ## Close the PNG file device
