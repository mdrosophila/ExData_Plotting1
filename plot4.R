##plot four plots into a 2x2 plot
plot4<-function(){
        
        ##download the file and unzip it and save it to filename
        ##read the file into the housepower data frame, and subset it  from dates 2007-02-01 to 2007-02-02
        
        ###download the file and unzip it to "filename"
        myurl<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
        download.file(myurl,"./household_power_consumption.zip")
        filename<-unzip("./household_power_consumption.zip")
        
        ###read in the file to the "housepower" dataframe
        
        housepower<-read.table(filename,
                               header=TRUE,
                               sep=";",
                               na.strings="?",
                               nrows=2100000,
                               comment.char="",
                               colClasses=c("factor","factor","numeric","numeric","numeric","numeric","numeric")
        )
        
        ###subsetting the dataframe from dates 2007-02-01 to 2007-02-02
        housepwr<-housepower[as.Date(housepower$Date,"%d/%m/%Y")
                             %in%  c(as.Date("2007-02-01","%Y-%m-%d"),
                                     as.Date("2007-02-02","%Y-%m-%d")),]
        
        ##combine Date and Time variables to a DateTime variable 
        pwrDate<-as.Date(housepwr$Date,"%d/%m/%Y")
        pwrDateTime<-paste0(pwrDate,housepwr$Time)
        housepwr$DateTime<-strptime(pwrDateTime,"%Y-%m-%d%H:%M:%S")
        
        
        png("./ExData_Plotting1/plot4.png")
        
        ##set a 2x2 plot, column first
        par(mfcol=c(2,2),bg="white")
        
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