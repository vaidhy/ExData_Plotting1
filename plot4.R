# Read the first line for header
headdt <- fread("household_power_consumption.txt", sep=";", 
                header=T, na.strings=c("?"), 
                stringsAsFactors=F, nrows=0)

# Read the file for two days worth of data after skipping unwanted data
dt <- fread("household_power_consumption.txt", sep=";", 
            header=F, na.strings=c("?"), 
            stringsAsFactors=F, skip=66637, nrows=2880)

# Assign column names from the header
setnames(dt, colnames(headdt))

# Open png device 
png(filename="plot4.png", width=480, height=480, unit="px")
par(mfrow=c(2,2))

with(dt, { 
    
    plot(strptime(paste(Date, Time), "%d/%m/%Y %T"), Global_active_power,
         type="n", xlab="", ylab="Global Active Power (kilowatts)")
    lines(strptime(paste(Date, Time), "%d/%m/%Y %T"), Global_active_power)
     
    plot(strptime(paste(Date, Time), "%d/%m/%Y %T"), Voltage,
         type="n", xlab="datetime", ylab="Voltage")
    lines(strptime(paste(Date, Time), "%d/%m/%Y %T"), Voltage)
    
    plot(strptime(paste(Date, Time), "%d/%m/%Y %T"), Sub_metering_1,
         type="n", xlab="", ylab="Energy sub metering")
    lines(strptime(paste(Date, Time), "%d/%m/%Y %T"), Sub_metering_1, col="black")
    lines(strptime(paste(Date, Time), "%d/%m/%Y %T"), Sub_metering_2, col="red")
    lines(strptime(paste(Date, Time), "%d/%m/%Y %T"), Sub_metering_3, col="blue")
    legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
         col=c("black", "red", "blue"), lty="solid", bty="n")
    
    plot(strptime(paste(Date, Time), "%d/%m/%Y %T"), Global_reactive_power,
         type="n", xlab="datetime", ylab="Global_reactive_power")
    lines(strptime(paste(Date, Time), "%d/%m/%Y %T"), Global_reactive_power)    
})
dev.off()




