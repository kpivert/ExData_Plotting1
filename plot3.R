
## R Code to create Plot 3: Line Plot of Energy Submetering by minute for 2007-02-01 and 2007-02-02


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

      with(febpower,  plot(datetime, Sub_metering_1, ylab = "Energy Sub metering",
            type = "n", xlab=""))
      with(febpower, lines(datetime, Sub_metering_1, col="black")) 
      with(febpower, lines(datetime, Sub_metering_2, col="red"))
      with(febpower, lines(datetime, Sub_metering_3, col="blue"))
      legend("topright", col=c("black", "red", "blue"), lwd=1, legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

      
      
## Save Plot 3 as PNG



          png("plot3.png", width = 480, height = 480)
          
          with(febpower,  plot(datetime, Sub_metering_1, ylab = "Energy Sub metering",
                               type = "n", xlab=""))
          with(febpower, lines(datetime, Sub_metering_1, col="black")) 
          with(febpower, lines(datetime, Sub_metering_2, col="red"))
          with(febpower, lines(datetime, Sub_metering_3, col="blue"))
          legend("topright", col=c("black", "red", "blue"), lwd=1, legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
              
          
          dev.off()



