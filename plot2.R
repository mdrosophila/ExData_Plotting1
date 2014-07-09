##plot Global Active power vs Date and Time

plot2<-function(){
        
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
        
        ##plot Global Active power vs the combined date and time variable
        png("./ExData_Plotting1/plot2.png")
        par(bg="white")
        plot(housepwr$DateTime,housepwr$Global_active_power,
             xlab="",ylab="Global Active Power (kilowatts)",type="l")
        dev.off()
        
}