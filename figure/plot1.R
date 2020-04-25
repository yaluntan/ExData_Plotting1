library(dplyr)
data <- read.table("household_power_consumption.txt",header = TRUE,sep = ";")
data <- tbl_df(data)


library(lubridate)
data$Date <- as.character(data$Date)
data$Date<- as.Date(parse_date_time(data$Date,"dmy"))


feb1 <- filter(data, Date=="2007-02-01")
feb2 <- filter(data, Date=="2007-02-02")
feb<- rbind(feb1,feb2)

library(datasets)
png(filename="plot1.png")
hist(as.numeric(as.character(feb$Global_active_power)), 
       xlab = "Global Active Power (kilowatts)",
       ylab = "Frequency",
       col="red",
       main="Global Active Power",
       yaxt="n")
axis(2,seq(0,1200,200),las=1)

dev.off()