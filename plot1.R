path <- setwd('/Users/huaig/Desktop/Nick/Coding/Coursera/Johns Hopkins University/4. Exploratory Data Analysis/Project/ExData_Plotting1')
path

library(data.table)

# Read data from file and remove missing values ('?')
power_DT <- data.table::fread(input = 'household_power_consumption.txt', 
                              na.strings = '?')

# Set data points for Date column to date type
power_DT[, Date := lapply(.SD, as.Date, '%d/%m/%Y'), .SDcols = c('Date')]

# Filter dates for 2007-02-01 and 2007-02-02
power_DT <- power_DT[(Date >= '2007-02-01') & (Date < '2007-02-03')]

png('plot1.png', width = 480, height = 480)

# plot1
hist(power_DT[, Global_active_power], main = 'Global Active Power', 
     xlab = 'Global Active Power (kilowatts)', ylab = 'Frequency', col = 'Red')

dev.off()