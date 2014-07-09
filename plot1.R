##download the file and unzip it and save it to filename
##read the file into the housepower data frame, and subset it  from dates 2007-02-01 to 2007-02-02

downloadfile<-function(){
        
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
}


##plot a histogram of Global_active_power at that time period 
##with default pixel setting, width = 480, height = 480
plot1<-function(){
        
        png("./ExData_Plotting1/plot1.png")
        par(bg="transparent")
        hist( housepwr$Global_active_power,
              col="red",main="Global Active Power",
              xlab="Global Active Power (kilowatts)",ylab="Frequency")
        dev.off()
}

