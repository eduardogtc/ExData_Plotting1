# ------------------------------------------------------------------------------------------------------------------------
# P L O T - 2
#
# Line plot Global Active Power by date
#
# ------------------------------------------------------------------------------------------------------------------------

# Load the data
source("Load_Data.R")

# Create the plot
png("plot2.png", width=480, height=480)
plot(consumption$Time, consumption$Global_active_power, col= "black", type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()