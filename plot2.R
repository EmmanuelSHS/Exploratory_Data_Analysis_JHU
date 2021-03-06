setwd(dir="D:\\Dream\\Documents\\Data Science\\Exploratory Data Analysis\\cc1\\")
Sys.setlocale("LC_TIME", "English")

data <- read.table("household_power_consumption.txt",
                   skip=66637, nrows=2880, sep=";", na.string="?" )
colnames(data) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
tmp_DT1 <- paste(data$Date, data$Time)
tmp_DT2 <- strptime(tmp_DT1, "%d/%m/%Y %H:%M:%S")
data$Date <- tmp_DT2

png(file="plot2.png", width=480, height=480)
res2 <- plot(data$Date, data$Global_active_power, type="l", 
             xlab="", ylab="Global Active Power (kilowatts)")
dev.copy(png, file="plot2.png")
dev.off()
