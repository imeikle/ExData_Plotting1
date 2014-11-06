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
png(file ="plot3.png")

# Create plot and draw first line, setting the limits of the y-axis
plot(cp1.datetime$datetime, cp1.datetime$Sub_metering_1, 
  type="l",
  xlab = "",
  ylab = "Energy sub metering",
  ylim = c(0,38))

# Draw the second line in red
lines(cp1.datetime$datetime, cp1.datetime$Sub_metering_2,
  type="l",
  col = "red")

# Draw the third line in blue
lines(cp1.datetime$datetime, cp1.datetime$Sub_metering_3, 
  type="l",
  col = "blue")

# Add the legend, deriving labels directly from the data frame
legend("topright",
  col=c("black", "red", "blue"),
  lty=1, 
  legend=colnames(cp1.datetime[7:9]))

# Close the bitmapped graphics device
dev.off()
