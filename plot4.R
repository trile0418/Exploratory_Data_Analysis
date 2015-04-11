
#setwd("D:/Downloads/DataScience/Coursera/Exploratory_Data_Analysis/Rcodes")

# Load data to R
power <- as.data.frame(read.csv("./exdata-data-household_power_consumption/household_power_consumption.txt", sep = ";", na.strings="?"))  # read text file

power$Date <- as.Date(power$Date, "%d/%m/%Y")
power$Global_active_power <- as.numeric(power$Global_active_power)

# Subset data
power <- subset(power, Date %in% (as.Date(c("2007-02-01", "2007-02-02"))))

# Create new column of Datetime
datetime <- paste(power$Date, power$Time)
power$Datetime <- as.POSIXct(datetime)

# Plot
par(mfrow = c(2,2))
with(power, {plot(Global_active_power ~ Datetime, type = "l", xlab = "", ylab = "Global Active Power") 
             plot(Voltage ~ Datetime, type = "l", xlab = "datatime", ylab = "Voltage")
             plot(Sub_metering_1 ~ Datetime, type="l", xlab="", ylab="Energy sub metering")
             lines(Sub_metering_2 ~ Datetime,col='Red')
             lines(Sub_metering_3 ~ Datetime,col='Blue')
             legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))           
             plot(Global_reactive_power ~ Datetime, type = "l", xlab = "datetime", ylab = "Global Reactive Power")})

# Save to .png file
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()


