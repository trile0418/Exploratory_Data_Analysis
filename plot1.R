
# setwd("D:/Downloads/DataScience/Coursera/Exploratory_Data_Analysis/Rcodes")

# Load data to R
power <- as.data.frame(read.csv("./exdata-data-household_power_consumption/household_power_consumption.txt", sep = ";", na.strings="?"))  # read text file

power$Date <- as.Date(power$Date, "%d/%m/%Y")
power$Global_active_power <- as.numeric(power$Global_active_power)

# Subset data
power <- subset(power, Date %in% (as.Date(c("2007-02-01", "2007-02-02"))))

# Histogram
hist(power$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
    
# Save to .png file
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()


