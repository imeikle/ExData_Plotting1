# Create a vector of class definitions for the columns
cp1.classes <- c("character", "character", "numeric", "numeric", "numeric", 
  "numeric", "numeric", "numeric", "numeric")

# Lines to be read determined by inspecting file
cp1.data <- read.table("data/household_power_consumption.txt", sep=";", 
  na.strings="?", colClasses = cp1.classes, nrows=2880, skip=66637)

# Need to read the first line in separately to use as column headers
cp1.cols <- read.table("data/household_power_consumption.txt", 
  stringsAsFactors = FALSE, nrows = 1, sep =";")
colnames(cp1.data) <- cp1.cols

# Add extra column, converting the first two columns to a date
cp1.datetime <- within(cp1.data, 
  datetime <- as.POSIXct(strptime(paste(cp1_data$Date, cp1_data$Time), 
  "%d/%m/%Y %H:%M:%S")))


# Open the PNG graphics device
png(file ="plot4.png")

# Set the layout to a 2x2 matrixx of plots
par(mfrow = c(2,2))

# Repeat plot from plot2.R
plot(cp1.datetime$datetime, cp1.datetime$Global_active_power,
  type = "l",
  xlab = "",
  ylab = "Global Active Power")

# Create new plot
plot(cp1.datetime$datetime, cp1.datetime$Voltage,
     type = "l",
     xlab = "datetime",
     ylab = "Voltage")

# Repeat plot from plot3.R
plot(cp1.datetime$datetime, cp1.datetime$Sub_metering_1,
  type="l",
  xlab = "",
  ylab = "Energy sub metering",
  ylim = c(0,38))

# Do not clean the frame prior to drawing
par(new=TRUE)
lines(cp1.datetime$datetime, cp1.datetime$Sub_metering_2,
  type="l",
  col = "red")

# Do not clean the frame prior to drawing
par(new=TRUE)
lines(cp1.datetime$datetime, cp1.datetime$Sub_metering_3,
  type="l",
  col = "blue")

# Do not clean the frame prior to drawing
par(new=TRUE)

# Repeat legend from plot3.R, but without box
legend("topright",
  col=c("black", "blue", "red"),
  lty=1,
  bty="n",
  legend=colnames(cp1_datetime[7:9]))

# Create new plot
plot(cp1.datetime$datetime, cp1.datetime$Global_reactive_power,
  type = "l",
  xlab = "datetime",
  ylab = "Global_reactive_power")

# Close the bitmapped graphics device
dev.off()
