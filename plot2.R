##plot Global Active power vs Date and Time

plot2<-function(){
        
        ##combine Date and Time variables to a DateTime variable 
        pwrDate<-as.Date(housepwr$Date,"%d/%m/%Y")
        pwrDateTime<-paste0(pwrDate,housepwr$Time)
        housepwr$DateTime<-strptime(pwrDateTime,"%Y-%m-%d%H:%M:%S")
        
        ##plot Global Active power vs the combined date and time variable
        png("./ExData_Plotting1/plot2.png")
        par(bg="transparent")
        plot(housepwr$DateTime,housepwr$Global_active_power,
             xlab="",ylab="Global Active Power (kilowatts)",type="l")
        dev.off()
        
}