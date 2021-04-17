
namefile <- "household_power_consumption.txt"
if (!file.exists(namefile)) {
  url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
  download.file(url, destfile = "data.zip")
  unzip("data.zip")  
}
df <- read.table(namefile, sep =  ";", header = T, na.strings = "?")
df <- df[c(1, 2, 3)]
df <- df[66637:(2881+66636),]
df$Date <-as.Date(df$Date, format = "%d/%m/%Y") 
date_time <-paste(df$Date, df$Time) 
df$Data_Time <- strptime(date_time,"%Y-%m-%d %H:%M:%S")
plot(df$Data_Time,df$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.copy(png, file = "plot2.png", height = 480, width = 480)
dev.off()

