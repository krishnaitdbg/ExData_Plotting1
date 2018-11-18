# read input file; mention field separator as ';' ; skip generic heading
hpc <- read.table("household_power_consumption.txt",skip=1,sep=';')

# append header row to the read data
names(hpc) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

# subset the read data as per the criteria 
subhpc <- subset(hpc,hpc$Date=="1/2/2007" | hpc$Date =="2/2/2007")

# Open png device 
png("plot1.png", width=480, height=480)

# Generate histogram as required with color, title and axis label
hist(as.numeric(subhpc$Global_active_power),col="red",main="Global Active Power",xlab="Global Active Power(kilowatts)")

# Turn off png device 
dev.off()

