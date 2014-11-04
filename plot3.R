cp1_col_classes <- c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric")
cp1_data <- read.table("data/household_power_consumption.txt", sep=";", na.strings="?", colClasses = cp1_col_classes, nrows=2879, skip=66637)

# How to verify no NA values included? Looks as if not an issue using Sublime Text

# Need to read the first line in separately to use as column headers.

cp1_cols <- read.table("data/household_power_consumption.txt", stringsAsFactors = FALSE, nrows = 1, sep =";")

#The first two columns should be read in as a date+time:
cp1_datetime <- within(cp1_data, datetime <- as.POSIXct(strptime(paste(cp1_data$Date, cp1_data$Time), "%d/%m/%Y %H:%M:%S")))

# with(cp1_datetime, plot(datetime, Sub_metering_1, type="n"))
# with(cp1_datetime, plot(datetime, Sub_metering_2, type="n"))
# with(cp1_datetime, plot(datetime, Sub_metering_3, type="n", xlab = "", ylab = "Energy sub metering", ylim = c(0,38)))
# with(cp1_datetime, lines(datetime, Sub_metering_1, type="l"))
# with(cp1_datetime, lines(datetime, Sub_metering_2, type="l", col = "red"))
# with(cp1_datetime, lines(datetime, Sub_metering_3, type="l", col = "blue"))

# with(cp1_datetime, plot(datetime, Sub_metering_1, type="l", xlab = "", ylab = "Energy sub metering", ylim = c(0,38)))
# with(cp1_datetime, lines(datetime, Sub_metering_2, type="l", col = "red"))
# with(cp1_datetime, lines(datetime, Sub_metering_3, type="l", col = "blue"))

attach(cp1_datetime)
plot(datetime, Sub_metering_1, type="l", xlab = "", ylab = "Energy sub metering", ylim = c(0,38))
lines(datetime, Sub_metering_2, type="l", col = "red")
lines(datetime, Sub_metering_3, type="l", col = "blue")
