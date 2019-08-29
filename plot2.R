# Peer-graded assignment Week 1 Cousera Data science Specialisation Cours 4: Explanatory Analysis 
# script for plot 2 by Emeline Mourocq

# to set the directory
setwd("C:/Users/EmelineMourocq/Documents/Giving Life to Data Project/COURS/Coursera-Data Science Specialization/Cours 4 - Exploratory Data Analysis/Week 1/Peer-graded Assignment Course Project 1")

# Data Loading
hpcData <-read.table("household_power_consumption.txt",sep=";",header=T)
head(hpcData)
str(hpcData)

# Data subsetting
hpcDataSubset<-subset(hpcData,Date==c("1/2/2007","2/2/2007"))

# convert variable of interest to numeric
hpcDataSubset$Global_active_power<-as.numeric(as.character(hpcDataSubset$Global_active_power))
str(hpcDataSubset) # verification

# Convertion Date and Time variable into a DateTime variable
hpcDataSubset$DateTime<-paste(hpcDataSubset$Date, hpcDataSubset$Time) # concatenate Date and Time in one variable
hpcDataSubset$DateTime<-strptime(hpcDataSubset$DateTime, "%d/%m/%Y %H:%M:%S")

# Construct the plot and save it to a PNG file with a width of 480 pixels and a height of 480 pixels.
png(file = "plot2.png") ## Open PNG device; create 'plot2.png' in my working directory

with(hpcDataSubset,plot(DateTime,Global_active_power,
                        xlab="", ylab="Global Active Power (kilowatts)",type="n"))
with(hpcDataSubset,lines(DateTime,Global_active_power))
                
dev.off() ## Close the PNG file device

