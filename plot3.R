##plot three submeters to date and time
plot3<-function(){
        
        ##combine Date and Time variables to a DateTime variable 
        pwrDate<-as.Date(housepwr$Date,"%d/%m/%Y")
        pwrDateTime<-paste0(pwrDate,housepwr$Time)
        housepwr$DateTime<-strptime(pwrDateTime,"%Y-%m-%d%H:%M:%S")
        
        ##plot  Sub_metering_1 first and add lines of second and third submertings
        ##followed by adding legends
        ##Unfortunately, Sub_metering_2, and 3 are facotr variables
        ##They have to be converted to numeic by as.character followed by as.numeric command
        png("./ExData_Plotting1/plot3.png")
        par(bg="transparent")
        plot(housepwr$DateTime,housepwr$Sub_metering_1,
             xlab="",ylab="Global Active Power (kilowatts)",type="l")
        with(housepwr,lines(DateTime, as.numeric(as.character(Sub_metering_2)),col = "red"))
        with(housepwr,lines(DateTime, as.numeric(as.character(Sub_metering_3)),col = "blue"))
        legend("topright", lty=c(1, 1, 1), 
               col = c("black","red","blue"), 
               legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))   
        dev.off()
        
}