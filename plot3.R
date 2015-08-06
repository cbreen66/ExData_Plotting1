# plot3 for Exploratory Data Analysis Week 1 Assignment
setwd("./ExData_Plotting1")
datafile <- ("household_power_consumption.txt")

#Import and subset the data
data <- read.table(datafile, header = TRUE, sep = ";", colClasses = c("character", "character", rep("numeric",7)), na = "?")
Consumption <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")

#Create a new variable "DateTime" with dates and times in Date/Time class
Consumption$DateTime <- with(Consumption, strptime(paste(Date,Time), "%d/%m/%Y %H:%M:%S"))
rownames(Consumption) <- 1:nrow(Consumption)

# Generate a png file
png(filename = "plot3.png", width = 480, height = 480, units = "px", bg = "transparent")

#Draw the plot using Sub_metering_1 variable
with(Consumption, plot(DateTime, Sub_metering_1, 
     type = "l",
     col = "black",
     xlab = "", ylab = "Energy sub metering"))

#Add lines for Sub_metering_2 and Sub_metering_3
with(Consumption, lines(DateTime, Sub_metering_2, col = "red"))
with(Consumption, lines(DateTime, Sub_metering_3, col = "blue"))

#Add legend in top right of plot
legend("topright", 
       col = c("black", "red", "blue"),
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lwd = 1)
dev.off()