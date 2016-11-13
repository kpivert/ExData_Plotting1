
## R Code to create Plot 1: Histogram of Global Active Power (kilowatts) for 2007-02-01 and 2007-02-02


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
      febpower$datetime <- strptime(febpower$datetime, "%m/%d/%Y %H:%M:%S")
  
      
      
## Create Histogram 
      
      hist(febpower$Global_active_power, xlab = "Global Active Power (kilowatts)", 
           col="red", main = "Global Active Power")
      

## Save Plot 1 as PNG
      
      
      
      png("plot1.png", width = 480, height = 480)
      
      hist(febpower$Global_active_power, xlab = "Global Active Power (kilowatts)", 
           col="red", main = "Global Active Power")
      
      
      dev.off()
      
      