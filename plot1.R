# ------------------------------------------------------------------------------------------------------------------------
# P L O T - 1
#
# Histogram by Global Active Power
#
# ------------------------------------------------------------------------------------------------------------------------

# Load the data
source("Load_Data.R")

# Create the plot
png("plot1.png", width=480, height=480)
hist(consumption$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()