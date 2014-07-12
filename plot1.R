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
png(filename="plot1.png", width=480, height=480, unit="px")
with(dt, 
    hist(Global_active_power, xlab="Global Active Power (kilowatts)", col="red", 
        main="Global Active Power")
)
dev.off()

