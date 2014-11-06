cp1_col_classes <- c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric")
cp1_data <- read.table("data/household_power_consumption.txt", sep=";", na.strings="?", colClasses = cp1_col_classes, nrows=2880, skip=66637)

# How to verify no NA values included? Looks as if not an issue using Sublime Text

# Need to read the first line in separately to use as column headers.

cp1_cols <- read.table("data/household_power_consumption.txt", stringsAsFactors = FALSE, nrows = 1, sep =";")
colnames(cp1_data) <- cp1_cols

# Plot first histogram - needs labels and titles
hist(cp1_data$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
dev.copy(png, file = "plot1.png")
dev.off()
