# Peer-graded assignment Week 1 Cousera Data science Specialisation Cours 4: Explanatory Analysis 
# script for plot 4 by Emeline Mourocq

# to set the directory
setwd("C:/Users/EmelineMourocq/Documents/Giving Life to Data Project/COURS/Coursera-Data Science Specialization/Cours 4 - Exploratory Data Analysis/Week 1/Peer-graded Assignment Course Project 1")

# Data Loading
hpcData <-read.csv("household_power_consumption.txt",sep=";",header=T)
head(hpcData)
str(hpcData)

# Data subsetting
hpcDataSubset<-subset(hpcData,Date==c("1/2/2007","2/2/2007"))

# convert variable of interest to numeric
hpcDataSubset$Sub_metering_1<-as.numeric(as.character(hpcDataSubset$Sub_metering_1))
hpcDataSubset$Sub_metering_2<-as.numeric(as.character(hpcDataSubset$Sub_metering_2))
hpcDataSubset$Global_active_power<-as.numeric(as.character(hpcDataSubset$Global_active_power))
hpcDataSubset$Voltage<-as.numeric(as.character(hpcDataSubset$Voltage))
hpcDataSubset$Global_reactive_power<-as.numeric(as.character(hpcDataSubset$Global_reactive_power))
str(hpcDataSubset) # verification

# Convertion Date and Time variable into a DateTime variable
hpcDataSubset$DateTime<-paste(hpcDataSubset$Date, hpcDataSubset$Time) # concatenate Date and Time in one variable
hpcDataSubset$DateTime<-strptime(hpcDataSubset$DateTime, "%d/%m/%Y %H:%M:%S")

# Construct the plot and save it to a PNG file with a width of 480 pixels and a height of 480 pixels.
png(file = "plot4.png") ## Open PNG device; create 'plot4.png' in my working directory

par(mfrow=c(nrows =2,ncols=2)) # create a matrix of nrows x ncols plots
# plot top left
with(hpcDataSubset,plot(DateTime,Global_active_power,
                        xlab="", ylab="Global Active Power",type="n"))
with(hpcDataSubset,lines(DateTime,Global_active_power))

# plot top right
with(hpcDataSubset,plot(DateTime,Voltage,
                        xlab="datetime", ylab="Voltage ",type="n"))
with(hpcDataSubset,lines(DateTime,Voltage))

# plot bottom left
min_Sub_metering<-with(hpcDataSubset,min(c(Sub_metering_1,Sub_metering_2,Sub_metering_3)))# get the y min
max_Sub_metering<-with(hpcDataSubset,max(c(Sub_metering_1,Sub_metering_2,Sub_metering_3)))# get the y max
with(hpcDataSubset,plot(DateTime,as.numeric(Sub_metering_1),ylim=c(min_Sub_metering,max_Sub_metering),
                        xlab="", ylab="Energy sub metering",type="n"))
with(hpcDataSubset,lines(DateTime,Sub_metering_1,col="black"))
with(hpcDataSubset,lines(DateTime,Sub_metering_2,col="red"))
with(hpcDataSubset,lines(DateTime,Sub_metering_3,col="blue"))
with(hpcDataSubset,legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
                          col=c("black","red", "blue"), lty=1,cex=0.9,bty = "n"))

# plot bottom right
with(hpcDataSubset,plot(DateTime,Global_reactive_power,
                        xlab="datetime", ylab="Global_reactive_power",type="n"))
with(hpcDataSubset,lines(DateTime,Global_reactive_power))

dev.off() ## Close the PNG file device

