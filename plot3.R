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
png("plot3.png", width=480, height=480)

# Generate plot Timestamp vs Sub_metering% with appropriate labels and legends
plot(subhpc$Timestamp,as.numeric(as.character(subhpc$Sub_metering_1)),type="l",xlab="Day",ylab="Energy sub metering")
lines(subhpc$Timestamp,as.numeric(as.character(subhpc$Sub_metering_2)),type="l",col="red")
lines(subhpc$Timestamp,as.numeric(as.character(subhpc$Sub_metering_3)),type="l",col="blue")
legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

# Turn off png device 
dev.off()