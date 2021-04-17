
namefile <- "household_power_consumption.txt"
if (!file.exists(namefile)) {
  url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
  download.file(url, destfile = "data.zip")
  unzip("data.zip")  
}
df <- read.table(namefile, sep =  ";", header = T, na.strings = "?")
df <- df[66637:(2881+66636),]
df$Date <-as.Date(df$Date, format = "%d/%m/%Y") 
date_time <-paste(df$Date, df$Time) 
df$Data_Time <- strptime(date_time,"%Y-%m-%d %H:%M:%S")
df_sub1 <- df[,c("Data_Time","Sub_metering_1")]
df_sub2 <- df[,c("Data_Time","Sub_metering_2")]
df_sub3 <- df[,c("Data_Time","Sub_metering_3")]

plot(df_sub1$Data_Time,df_sub1$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(df_sub2$Data_Time,df_sub2$Sub_metering_2, col = "red")
lines(df_sub3$Data_Time,df_sub3$Sub_metering_3, col = "blue")

dev.copy(png, file = "plot3.png", height = 480, width = 480)
dev.off()
