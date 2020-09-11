path <- setwd('/Users/huaig/Desktop/Nick/Coding/Coursera/Johns Hopkins University/4. Exploratory Data Analysis/Project/ExData_Plotting1')
path

library(data.table)

# Read data from file and remove missing values ('?')
power_DT <- data.table::fread(input = 'household_power_consumption.txt', 
                              na.strings =  '?')

# Create a new Date_time column which combines Date and Time columns to POSIXct
power_DT[, Date_time := as.POSIXct(paste(Date, Time), 
                                   format = '%d/%m/%Y %H:%M:%S')]

# Filter Date_time for 2007-02-01 and 2007-02-02
power_DT <- power_DT[(Date_time >= '2007-02-01') & (Date_time < '2007-02-03')]

png('plot2.png', width = 480, height = 480)

# plot2
plot(x = power_DT[, Date_time], y = power_DT[, Global_active_power], type = 'l', 
     xlab = '', ylab = 'Global Active Power (kilowatts)')

dev.off()