setwd(dir="D:\\Dream\\Documents\\Data Science\\Exploratory Data Analysis\\cc1\\")
Sys.setlocale("LC_TIME", "English")

data <- read.table("household_power_consumption.txt",
                   skip=66637, nrows=2880, sep=";", na.string="?" )
colnames(data) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
tmp_DT1 <- paste(data$Date, data$Time)
tmp_DT2 <- strptime(tmp_DT1, "%d/%m/%Y %H:%M:%S")
data$Date <- tmp_DT2

png(file="plot4.png", width=480, height=480)
par(mfrow=c(2,2))
res1 <- plot(data$Date, data$Global_active_power, type="l", 
             xlab="", ylab="Global Active Power")

res2 <- plot(data$Date, data$Voltage, type="l",
             xlab="datatime", ylab="Voltage")

res31 <- plot(data$Date, data$Sub_metering_1, type="l", col="black",
              xlab="", ylab="Energy sub metering")
res32 <- lines(data$Date, data$Sub_metering_2, col="red")
res33 <- lines(data$Date, data$Sub_metering_3, col="blue")
lgd <- legend("topright", pch=1, 
              col=c("black", "red", "blue"), 
              legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

res4 <- plot(data$Date, data$Global_reactive_power, type="l",
             xlab="datatime", ylab="Global_reactive_power")
with(data, {
  res1
  res2
  res31
  res32
  res33
  lgd
  res4
})
dev.copy(png, file="plot4.png")
dev.off()
