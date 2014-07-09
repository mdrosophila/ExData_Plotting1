##plot four plots into a 2x2 plot
plot4<-function(){
        
        ##combine Date and Time variables to a DateTime variable 
        pwrDate<-as.Date(housepwr$Date,"%d/%m/%Y")
        pwrDateTime<-paste0(pwrDate,housepwr$Time)
        housepwr$DateTime<-strptime(pwrDateTime,"%Y-%m-%d%H:%M:%S")
        
        
        png("./ExData_Plotting1/plot4.png")
        
        ##set a 2x2 plot, column first
        par(mfcol=c(2,2),bg="transparent")
        
        ##first plot, Global active power vs Date and time
        plot(housepwr$DateTime,housepwr$Global_active_power,
             xlab="",ylab="Global Active Power (kilowatts)",type="l")
        
        ##second plot, three submeters vs Date and time
        plot(housepwr$DateTime,housepwr$Sub_metering_1,
             xlab="",ylab="Global Active Power (kilowatts)",type="l")
        with(housepwr,lines(DateTime, as.numeric(as.character(Sub_metering_2)),col = "red"))
        with(housepwr,lines(DateTime, as.numeric(as.character(Sub_metering_3)),col = "blue"))
        legend("topright", bty="n",lty=c(1, 1, 1), 
               col = c("black","red","blue"), 
               legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))
        
        ##third plot, voltage vs Date and time
        plot(housepwr$DateTime,housepwr$Voltage,
             type="l",xlab="datetime",ylab="Voltage") 
        
        ##fourth plot, Global reactive pwer vs Date and time
        plot(housepwr$DateTime,housepwr$Global_reactive_power,
             type="l",xlab="datetime",ylab="Global_reactive_power")
        dev.off()
}