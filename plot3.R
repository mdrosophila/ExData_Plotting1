##plot three submeters to date and time
plot3<-function(){
        
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
        
        ##plot  Sub_metering_1 first and add lines of second and third submertings
        ##followed by adding legends
        ##Unfortunately, Sub_metering_2, and 3 are facotr variables
        ##They have to be converted to numeic by as.character followed by as.numeric command
        png("./ExData_Plotting1/plot3.png")
        par(bg="white")
        plot(housepwr$DateTime,housepwr$Sub_metering_1,
             xlab="",ylab="Global Active Power (kilowatts)",type="l")
        with(housepwr,lines(DateTime, as.numeric(as.character(Sub_metering_2)),col = "red"))
        with(housepwr,lines(DateTime, as.numeric(as.character(Sub_metering_3)),col = "blue"))
        legend("topright", lty=c(1, 1, 1), 
               col = c("black","red","blue"), 
               legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))   
        dev.off()
        
}