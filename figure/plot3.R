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
png(filename="plot3.png")
plot(as.numeric(as.character(feb$Sub_metering_1)), 
     ylab = "Energy sub metering",
     xlab=" ",
     type="l",
     col="black",
     lwd=1,
     xaxt="n")
lines(as.numeric(as.character(feb$Sub_metering_2)),
      col="red")
lines(as.numeric(as.character(feb$Sub_metering_3)),
      col="blue")
axis(1, at=c(0,nrow(feb)/2,nrow(feb)),labels=c("Thu","Fri","Sat"))
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lwd=1,lty = 1,cex=0.8,
       col=c("black","red","blue"))
dev.off()
