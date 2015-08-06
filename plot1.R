# plot1 for Exploratory Data Analysis Week 1 Assignment
setwd("./ExData_Plotting1")
datafile <- ("household_power_consumption.txt")

#Import and subset the data
data <- read.table(datafile, header = TRUE, sep = ";", colClasses = c("character", "character", rep("numeric",7)), na = "?")
Consumption <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")

#Create a new variable "DateTime" with dates and times in Date/Time class
Consumption$DateTime <- with(Consumption, strptime(paste(Date,Time), "%d/%m/%Y %H:%M:%S"))
rownames(Consumption) <- 1:nrow(Consumption)

# Generate a png file
png(filename = "plot1.png", width = 480, height = 480, units = "px", bg = "transparent")

#Draw the histogram 
with(Consumption, hist(Global_active_power, 
     col = "red", 
     main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)",
     breaks = 12, ylim = c(0, 1200)))
dev.off()
