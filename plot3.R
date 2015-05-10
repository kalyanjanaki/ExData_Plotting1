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
#open the png Device
png(filename="plot3.png",width = 480, height = 480)
#ceate empty plot
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
dev.off()
