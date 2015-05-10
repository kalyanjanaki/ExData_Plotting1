# Read the data set into data frame called power
power = read.table("household_power_consumption.txt",header = TRUE,sep = ";")
#check for the different variables ans their types
str(power)
# Looks like name numeric variables are considerd as factors so lets arrage data types
power$Global_active_power = as.numeric(power$Global_active_power)
power$Global_reactive_power = as.numeric(power$Global_reactive_power)
power$Voltage = as.numeric(power$Voltage)
power$Global_intensity = as.numeric(power$Global_intensity)
power$Sub_metering_1 = as.numeric(power$Sub_metering_1)
power$Sub_metering_2 = as.numeric(power$Sub_metering_2)
power$Sub_metering_3 = as.numeric(power$Sub_metering_3)

# Change the Date variable in from factor to Date
power$Date = as.Date(power$Date,"%d/%m/%Y")
# We work only on first 2 days of Feb 2007 so subset the data inot dataframe sub_power
sub_power = subset(power, power$Date >= as.Date("2007-02-01") & power$Date <= as.Date("2007-02-02") )
# set Power to NULL to save memory
power = NULL
#  Have qucik look at new data fram sub_power
str(sub_power)
# time to open png device the paramters asked in assignment looks default 
png(filename = "plot1.png",width = 480, height = 480)
# based on the expected plot generate the hisotgram. 
# We need to divide X variable by 500 to meet scale expected by assignmnet
hist(sub_power$Global_active_power/500,col="red",xlab = "Global Active Power (kilowatts)",main="Global Active Power")
#off the deive to see the file
dev.off()
