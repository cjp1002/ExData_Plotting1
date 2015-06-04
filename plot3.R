##Read the full dataset and subset it
data_complete <- read.csv("household_power_consumption.txt", sep = ';', nrows = 2075259, header = TRUE,                            na.strings = "?", check.names = FALSE, 
                          stringsAsFactors = FALSE, comment.char = "", quote = '\"')
data_complete$Date <- as.Date(data_complete$Date, format = "%d/%m/%Y")
data <- subset(data_complete, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))
##remove the large file as no longer needed
rm(data_complete)
##convert the date and time
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)
##open the png option, draw the various graphs necessary for plot3 (only 2 full days), save the png file
png("plot3.png", width=480, height=480)
with(data, {
  plot(Sub_metering_1 ~ Datetime, type = "l", xlab = "",
       ylab = "Energy sub metering")
  lines(Sub_metering_2 ~ Datetime, col = 'Red')
  lines(Sub_metering_3 ~ Datetime, col = 'Blue')
})
legend("topright", col = c("black", "red", "blue"), lty = 1, lwd = 2, 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()
