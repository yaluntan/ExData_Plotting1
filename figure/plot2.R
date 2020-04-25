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
png(filename="plot2.png")
plot(as.numeric(as.character(feb$Global_active_power)), 
     ylab = "Global Active Power (kilowatts)",
     type="l",
     col="black",
     lwd=1,
     xaxt="n")
axis(1, at=c(0,nrow(feb)/2,nrow(feb)),labels=c("Thu","Fri","Sat"))
dev.off()
