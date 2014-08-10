setwd(dir="D:\\Dream\\Documents\\Data Science\\Exploratory Data Analysis\\cc1\\")
Sys.setlocale("LC_TIME", "English")

data <- read.table("household_power_consumption.txt",
                   skip=66637, nrows=2880, sep=";", na.string="?" )
colnames(data) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
tmp_DT1 <- paste(data$Date, data$Time)
tmp_DT2 <- strptime(tmp_DT1, "%d/%m/%Y %H:%M:%S")
data$Date <- tmp_DT2

png(file="plot3.png", width=480, height=480)
res31 <- plot(data$Date, data$Sub_metering_1, type="l", col="black",
              xlab="", ylab="Energy sub metering")
res32 <- lines(data$Date, data$Sub_metering_2, col="red")
res33 <- lines(data$Date, data$Sub_metering_3, col="blue")
lgd <- legend("topright", pch=1, 
              col=c("black", "red", "blue"), 
              legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
with(data, res31)
with(data, lines)
with(data, lines)
with(data, lgd)
dev.copy(png, file="plot3.png")
dev.off()
