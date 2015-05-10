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
png(filename="plot2.png",width = 480, height = 480)
# first Create empty plot window with labels. Based on expected scale of Golbal Active power divinde it by 500
plot(sub_power$Date,(sub_power$Global_active_power/500),type="n",xlab = "",ylab = "Global Active Power (kilowatts)")
# We are expected to have lines Graph so add lines 
lines(sub_power$Date,sub_power$Global_active_power/500)
dev.off()


