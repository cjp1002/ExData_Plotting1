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
##open the png option, draw the histogram necessary for plot1, save the png
png("plot1.png", width=480, height=480)
hist(data$Global_active_power, main = paste("Global Active Power"), xlab = "Global Active Power (kilowatts)", col = "red")
dev.off()