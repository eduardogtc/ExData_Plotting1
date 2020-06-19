# ------------------------------------------------------------------------------------------------------------------------
# P L O T - 4
#
# 4 charts in 2 columns and 2 rows:
#
# Global Active power by date <-> Voltage by date
# Energy sub metering by date <-> Global reactive power by Date
#
# ------------------------------------------------------------------------------------------------------------------------

# Load the data 
source("Load_Data.R")

# Create the plot
png("plot4.png", width=480, height=480)

# Set to 2 rows and 2 coluns
par(mfrow = c(2, 2)) 

# First Chart - Global Active Power by Date
plot(consumption$Time, consumption$Global_active_power, type="l", xlab="", ylab="Global Active Power")

# Second Chart - Voltage by Date
plot(consumption$Time, consumption$Voltage, type="l", xlab="datetime", ylab="Voltage")

# Third Chart - Energy sub metering by date
plot(consumption$Time, consumption$Sub_metering_1, type="l", ylab="Energy submeter", xlab="") #  Plot the first line
lines(consumption$Time, consumption$Sub_metering_2, type="l", col="red") # Second line
lines(consumption$Time, consumption$Sub_metering_3, type="l", col="blue") # Third line

legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty = "n", lty=, lwd=1, col=c("black", "red", "blue") )

# Forth Chart - Global reactive power by Date
plot(consumption$Time, consumption$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()