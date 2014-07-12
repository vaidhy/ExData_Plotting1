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
png(filename="plot3.png", width=480, height=480, unit="px")

with(dt, {
    plot(strptime(paste(dt$Date, dt$Time), "%d/%m/%Y %T"), dt$Sub_metering_1, 
        type="n", xlab="", ylab="Energy sub metering")
    lines(strptime(paste(dt$Date, dt$Time), "%d/%m/%Y %T"), dt$Sub_metering_1, col="black")
    lines(strptime(paste(dt$Date, dt$Time), "%d/%m/%Y %T"), dt$Sub_metering_2, col="red")
    lines(strptime(paste(dt$Date, dt$Time), "%d/%m/%Y %T"), dt$Sub_metering_3, col="blue")
    legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
        col=c("black", "red", "blue"), lty="solid")
})

dev.off()



