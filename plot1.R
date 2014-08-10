setwd(dir="D:\\Dream\\Documents\\Data Science\\Exploratory Data Analysis\\cc1\\")
data <- read.table("household_power_consumption.txt",
                   skip=66637, nrows=2880, sep=";", na.string="?" )
colnames(data) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
#data$Time <- strptime(data$Time, format = "")
#data$Date <- as.Date(data$Date)

png(file="plot1.png", width=480, height=480)
res1 <- hist(data$Global_active_power, main="Global Active Power", xlab='Global Active Power (kilowatts)', ylab='Frequency',
     col='2', ylim=c(0,1200))
with(data, res1)
dev.copy(png, file="plot1.png")
dev.off()
