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

# Plot histogram to the screen graphics device
hist(cp1.data$Global_active_power, col = "red", 
  xlab = "Global Active Power (kilowatts)", main = "Global Active Power")

# Copy to the bitmapped graphics device
dev.copy(png, file = "plot1.png")
dev.off()
