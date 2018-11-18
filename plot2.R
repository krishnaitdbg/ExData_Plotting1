# read input file; mention field separator as ';' ; skip generic heading
hpc <- read.table("household_power_consumption.txt",skip=1,sep=';')

# append header row to the read data
names(hpc) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

# subset the read data as per the criteria 
subhpc <- subset(hpc,hpc$Date=="1/2/2007" | hpc$Date =="2/2/2007")

# create column Timestamp by combining columns Date & Time from subset data; this newly created column will be used as X-axis data
Timestamp <- strptime(paste(subhpc$Date, subhpc$Time, sep=" "),"%d/%m/%Y %H:%M:%S")

# column bind newly created column Timestamp with subset data
subhpc <- cbind(subhpc, Timestamp)

# Open png device 
png("plot2.png", width=480, height=480)

# Generate plot Timestamp vs Global_active_power with appropriate labels
plot(subhpc$Timestamp, as.numeric(as.character(subhpc$Global_active_power)),type="l",xlab="Day",ylab="Global Active power (kilowatts)")

# Turn off png device 
dev.off()
