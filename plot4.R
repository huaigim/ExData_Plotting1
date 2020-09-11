path <- setwd('/Users/huaig/Desktop/Nick/Coding/Coursera/Johns Hopkins University/4. Exploratory Data Analysis/Project/ExData_Plotting1')
path

library(data.table)

# Read data from file and remove missing values ('?')
power_DT <- data.table::fread(input = 'household_power_consumption.txt', 
                              na.strings = '?')

# Create a new Date_time column which combines Date and Time columns to POSIXct
power_DT[, Date_time := as.POSIXct(paste(Date, Time), 
                                   format = '%d/%m/%Y %H:%M:%S')]

# Filter Date_time for 2007-02-01 and 2007-02-02
power_DT <- power_DT[(Date_time >= '2007-02-01') & (Date_time < '2007-02-03')]

png('plot4.png', width = 480, height = 480)

par(mfrow = c(2, 2))

# plot4a
plot(power_DT[, Date_time], power_DT[, Global_active_power], type = 'l', 
     xlab = '', ylab = 'Global Active Power')

# plot4b
plot(power_DT[, Date_time], power_DT[, Voltage], type = 'l', xlab = 'datetime', 
     ylab = 'Voltage')

# plot4c
plot(power_DT[, Date_time], power_DT[, Sub_metering_1], type = 'l', xlab = '', 
     ylab = 'Energy sub metering')
lines(power_DT[, Date_time], power_DT[, Sub_metering_2], col = 'red')
lines(power_DT[, Date_time], power_DT[, Sub_metering_3], col = 'blue')
legend('topright', col = c('black', 'red', 'blue'), lty = c(1, 1), bty = 'n',
       cex = .95, c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'))

# plot4d
plot(power_DT[, Date_time], power_DT[, Global_reactive_power], type = 'l', 
     xlab = 'datetime', ylab = 'Global_reactive_power')

dev.off()