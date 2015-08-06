# plot4 for Exploratory Data Analysis Week 1 Assignment
setwd("./exData_Plotting1")
datafile <- ("household_power_consumption.txt")

#Import and subset the data
data <- read.table(datafile, header = TRUE, sep = ";", colClasses = c("character", "character", rep("numeric",7)), na = "?")
Consumption <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")

#Create a new variable "DateTime" with dates and times in Date/Time class
Consumption$DateTime <- with(Consumption, strptime(paste(Date,Time), "%d/%m/%Y %H:%M:%S"))
rownames(Consumption) <- 1:nrow(Consumption)

# Generate a png file
png(filename = "plot4.png", width = 480, height = 480, units = "px", bg = "transparent")

#Set graphical parameters with 2 rows and 2 columns
par(mfrow = c(2, 2))

# Plot Global Active Power over time in the top left
with(Consumption, plot(DateTime, Global_active_power, 
     type = "l",
     xlab = "", ylab = "Global Active Power"))

# Plot Voltage over time in the top right 
with(Consumption, plot(DateTime, Voltage,
     type = "l",
     xlab = "datetime", ylab = "Voltage"))

# Plot three energy sub-metering lines in the bottom left
with(Consumption, plot(DateTime, Sub_metering_1, 
     type = "l",
     col = "black",
     xlab = "", ylab = "Energy sub metering"))
with(Consumption, lines(DateTime, Sub_metering_2, col = "red"))
with(Consumption, lines(DateTime, Sub_metering_3, col = "blue"))

# Add legend to plot three
legend("topright", 
       bty = "n",
       col = c("black", "red", "blue"),
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lwd = 1)

# Plot global reactive power in the bottom right
with(Consumption, plot(DateTime, Global_reactive_power, 
     type = "l",
     col = "black",
     xlab = "datetime", ylab = colnames(Consumption)[4]))
dev.off()