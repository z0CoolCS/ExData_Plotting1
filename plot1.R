namefile <- "household_power_consumption.txt"
if (!file.exists(namefile)) {
  url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
  download.file(url, destfile = "data.zip")
  unzip("data.zip")  
}

df <- read.table(namefile, sep =  ";", header = T, na.strings = "?")
df <- df[66637:(2880+66636),]
hist(df$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", ylab = "Frequency", main = "Global Active Power")
dev.copy(png, file = "plot1.png", height = 480, width = 480)
dev.off()
