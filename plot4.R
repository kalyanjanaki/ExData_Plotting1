# read the date set inot data frame called power
power = read.table("household_power_consumption.txt",header = TRUE,sep = ";")
# Have a look at Data frame 
str(power)
# Looks like variable of intrest "Global_active_power" is considered as factor change to numeric
power$Global_active_power = as.numeric(power$Global_active_power)
#Using Date and Time variable create R posixct or posixlt and set to Date variable
power$Date = strptime(paste(power$Date," ",power$Time),format = "%d/%m/%Y %H:%M:%S")
# Our analysis is only on 2 days of Observation so created Subset into sub_power
sub_power = subset(power, (as.Date(power$Date) >= as.Date("2007-02-01") ) & (as.Date(power$Date) <= as.Date("2007-02-02")))
sub_power$Voltage = as.numeric(sub_power$Voltage)
sub_power$Global_reactive_power = as.numeric(sub_power$Global_reactive_power)
png(filename="plot4.png",width = 480, height = 480)
par(mfrow = c(2,2))
plot(sub_power$Date,(sub_power$Global_active_power/500),type="n",xlab = "",ylab = "Global Active Power (kilowatts)")
lines(sub_power$Date,sub_power$Global_active_power/500)
plot(sub_power$Date,(sub_power$Voltage/10),type="n",xlab = "datetime",ylab = "Voltage")
lines(sub_power$Date,sub_power$Voltage/10)
plot(sub_power$Date,sub_power$Sub_metering_1,type="n",xlab = "",ylab = "Energy sub metering")
lines(sub_power$Date,sub_power$Sub_metering_1)
lines(sub_power$Date,sub_power$Sub_metering_2,col="red")
lines(sub_power$Date,sub_power$Sub_metering_3,col="blue")
legend("topright",
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       #bg = "transparent",
       #bty = "n",
       lty = c(1,1,1),
       col = c("black", "red", "blue")
)
plot(sub_power$Date,(sub_power$Global_reactive_power/460),type="n",xlab = "",ylab = "Globale_reactive_power")
lines(sub_power$Date,sub_power$Global_reactive_power/460)
dev.off()


