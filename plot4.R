namefile <- "household_power_consumption.txt"
if (!file.exists(namefile)) {
  url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
  download.file(url, destfile = "data.zip")
  unzip("data.zip")  
}

df <- read.table(namefile, sep =  ";", header = T, na.strings = "?")
df <- df[66637:(2880+66636),]
df$Date <-as.Date(df$Date, format = "%d/%m/%Y") 
date_time <-paste(df$Date, df$Time) 
df$Data_Time <- strptime(date_time,"%Y-%m-%d %H:%M:%S")


df_sub1 <- df[,c("Data_Time","Sub_metering_1")]
df_sub2 <- df[,c("Data_Time","Sub_metering_2")]
df_sub3 <- df[,c("Data_Time","Sub_metering_3")]


par(mfrow = c(2, 2), mar = c(4, 4, 2, 1), oma = c(0, 0, 2, 0))

plot(df$Data_Time,df$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")

plot(df$Data_Time,df$Voltage, type="l", xlab = "datetime", ylab="Voltage")


plot(df_sub1$Data_Time,df_sub1$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(df_sub2$Data_Time,df_sub2$Sub_metering_2, col = "red")
lines(df_sub3$Data_Time,df_sub3$Sub_metering_3, col = "blue")

plot(df$Data_Time,df$Global_reactive_power, type="l", xlab = "datetime", ylab="Global_reactive_power")


dev.copy(png, file = "plot4.png", height = 480, width = 480)
dev.off()