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
png(file ="plot2.png")

# Create plot, but don't print to the graphics device
plot(cp1.datetime$Global_active_power ~ cp1.datetime$datetime, 
  type = "n", 
  xlab = "", 
  ylab = "Global Active Power (kilowatts)")

# Draw the line graph
lines(cp1.datetime$Global_active_power ~ cp1.datetime$datetime, type = "l")

# Close the bitmapped graphics device
dev.off()