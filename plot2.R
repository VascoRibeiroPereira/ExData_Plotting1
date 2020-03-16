library(dplyr)
library(lubridate)
library(readr)

fileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileURL, destfile = "./data.zip", method = "curl")
unzip("./data.zip")

myData <- read_delim("./household_power_consumption.txt", ";" ,na = "?", )
myData$Date <- parse_date(myData$Date, "%d/%m/%Y")
myData <- filter(myData, Date >= "2007-02-01", Date <="2007-02-02")
myData <- mutate(myData, DateTime = ymd_hms(paste(Date, Time)))

png(filename = "plot2.png")
with(myData, plot(DateTime, Global_active_power, xlab = "", ylab = "Global Active Power (kilowatts)", type = "l"))
dev.off()


