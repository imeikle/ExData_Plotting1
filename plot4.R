cp1_col_classes <- c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric")
cp1_data <- read.table("data/household_power_consumption.txt", sep=";", na.strings="?", colClasses = cp1_col_classes, nrows=2879, skip=66637)

# How to verify no NA values included? Looks as if not an issue using Sublime Text

# Need to read the first line in separately to use as column headers.

cp1_cols <- read.table("data/household_power_consumption.txt", stringsAsFactors = FALSE, nrows = 1, sep =";")
colnames(cp1_data) <- cp1_cols

#The first two columns should be read in as a date+time:
cp1_datetime <- within(cp1_data, datetime <- as.POSIXct(strptime(paste(cp1_data$Date, cp1_data$Time), "%d/%m/%Y %H:%M:%S")))

attach(cp1_datetime)
par(mfrow = c(2,2))

plot(datetime, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

plot(datetime, Voltage, type = "l")

plot(datetime, Sub_metering_1, type="l", xlab = "", ylab = "Energy sub metering", ylim = c(0,38))
par(new=TRUE)
lines(datetime, Sub_metering_2, type="l", col = "red")
par(new=TRUE)
lines(datetime, Sub_metering_3, type="l", col = "blue")

plot(datetime, Global_active_power, type = "l")