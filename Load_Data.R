# ----------------------------------------------------------------
# Script to load the data
# ----------------------------------------------------------------
library(data.table)


## Create a sub folder (IF NOT EXISTS) to store the data
sub_dir <- "project_data"
output_dir <- file.path(getwd(), sub_dir)

if (!dir.exists(output_dir)){
    dir.create(output_dir)
}

## Download and unzip the zip file
zip_file <- file.path( output_dir, "raw_data.zip")
url_target <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(url_target, zip_file)
unzip(zipfile=zip_file, exdir = output_dir)


## Read data
consumption <- fread(file=file.path( output_dir, "household_power_consumption.txt"))

## Convert the date to the class Date 
consumption[, Date:=as.Date(Date, "%d/%m/%Y")]

## Subset by date
consumption <- consumption[Date == as.Date("2007-02-01", "%Y-%m-%d") | Date == as.Date("2007-02-02", "%Y-%m-%d") ] 

## Now with a smaller dataset, convert the other columns
consumption[, Global_active_power:=as.numeric(Global_active_power)]
consumption[, Global_reactive_power :=as.numeric(Global_reactive_power )]
consumption[, Voltage:=as.numeric(Voltage)]
consumption[, Global_intensity:=as.numeric(Global_intensity)]
consumption[, Sub_metering_1:=as.numeric(Sub_metering_1)]
consumption[, Sub_metering_2:=as.numeric(Sub_metering_2)]
consumption[, Sub_metering_3:=as.numeric(Sub_metering_3)]

## Convert the time
consumption[, Time:=as.POSIXct(paste(format(Date, "%d/%m/%Y" ), Time, sep=" "), tz = "", format="%d/%m/%Y %H:%M:%S") ]


