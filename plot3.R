# ------------------------------------------------------------------------------------------------------------------------
# P L O T - 3
#
# Line plot all sub metering by date
#
# ------------------------------------------------------------------------------------------------------------------------

# Load the data
source("Load_Data.R")

# Create the plot
png("plot3.png", width=480, height=480)
plot(consumption$Time, consumption$Sub_metering_1, type="l", ylab="Energy Submetering", xlab="")
lines(consumption$Time, consumption$Sub_metering_2, type="l", col="red")
lines(consumption$Time, consumption$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"),  lty=1, lwd=2 )
dev.off()