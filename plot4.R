
## R Code to create Plot 4: Matrix of 4 plots: 1) Global Active Power against minute; 2)  Voltage against minute; 3) Energy sub metering against minute; 4)
## showing Plot of Energy Submetering by minute for 2007-02-01 and 2007-02-02


## Download Data File From Coursera Website and Unzip Contents


          temp <- tempfile()
          download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", 
                        temp)
          con <- unz(temp, "household_power_consumption.txt")
          dat <- read.table(con, header=T, sep=";", na.strings = "?")
          unlink(temp)

## Subset Data for Observations from 2007-02-01 and 2007-02-02

          target <- c("2/1/2007", "2/2/2007")
          febpower <- subset(dat, Date %in% target)


## Change Date and Time 

          febpower$datetime <- paste(febpower$Date, febpower$Time)
          febpower$datetime <- strptime(febpower$datetime, "%m/%d/%Y %H:%M:%S")



## Create matrix of plots 
          par(mfrow= c(2,2))
          
## Plot 1: Global Active Power against minute           
          
          with(febpower,  plot(datetime, Global_active_power, ylab = "Global Active Power",
                               type = "l",  xlab=""))
          
## Plot 2: Voltage against minute
          with(febpower,  plot(datetime, Voltage, ylab = "Voltage",
                               type = "l"))        

          
## Plot 3: Energy sub metering against minute
          with(febpower,  plot(datetime, Sub_metering_1, ylab = "Energy Sub metering",
                               type = "n", xlab=""))
          with(febpower, lines(datetime, Sub_metering_1, col="black")) 
          with(febpower, lines(datetime, Sub_metering_2, col="red"))
          with(febpower, lines(datetime, Sub_metering_3, col="blue"))
          legend("topright", col=c("black", "red", "blue"), lwd=1, legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
          
## Plot 4:   
          with(febpower,  plot(datetime, Global_reactive_power, ylab = "Global_reactive_power",
                               type = "l"))   

          
          
## Save Plot 4 as PNG



          png("plot4.png", width = 480, height = 480)
          
          ## Create matrix of plots 
          par(mfrow= c(2,2))
          
          ## Plot 1: Global Active Power against minute           
          
          with(febpower,  plot(datetime, Global_active_power, ylab = "Global Active Power",
                               type = "l",  xlab=""))
          
          ## Plot 2: Voltage against minute
          with(febpower,  plot(datetime, Voltage, ylab = "Voltage",
                               type = "l"))        
          
          
          ## Plot 3: Energy sub metering against minute
          with(febpower,  plot(datetime, Sub_metering_1, ylab = "Energy Sub metering",
                               type = "n", xlab=""))
          with(febpower, lines(datetime, Sub_metering_1, col="black")) 
          with(febpower, lines(datetime, Sub_metering_2, col="red"))
          with(febpower, lines(datetime, Sub_metering_3, col="blue"))
          legend("topright", col=c("black", "red", "blue"), lwd=1, legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
          
          ## Plot 4:   
          with(febpower,  plot(datetime, Global_reactive_power, ylab = "Global_reactive_power",
                               type = "l"))   
          
          
              
          dev.off()



