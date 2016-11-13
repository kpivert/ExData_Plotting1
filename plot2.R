
## R Code to create Plot 2: Line Plot of Global Active Power (kilowatts) by minute for 2007-02-01 and 2007-02-02


## Download Data File From Coursera Website and Unzip Contents


temp <- tempfile()
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", 
              temp)
con <- unz(temp, "household_power_consumption.txt")
dat <- read.table(con, header=T, sep=";", na.strings = "?")
unlink(temp)

## Subset Data for Observations from 2007-02-01 and 2007-02-02

target <- c("1/2/2007", "2/2/2007")
febpower <- subset(dat, Date %in% target)


## Change Date and Time 

febpower$datetime <- paste(febpower$Date, febpower$Time)
febpower$datetime <- strptime(febpower$datetime, "%d/%m/%Y %H:%M:%S")



## Create plot 
par(mar=c(5.1, 4.1,4.1,2.1))
with(febpower,  plot(datetime, Global_active_power, ylab = "Global Active Power (kilowatts)",
     type = "l", xlab=""))


## Save Plot 2 as PNG



png("plot2.png", width = 480, height = 480)

par(mar=c(3, 4.1,4.1,2.1))
with(febpower,  plot(datetime, Global_active_power, ylab = "Global Active Power (kilowatts)",
                     type = "l", xlab=""))

dev.off()

