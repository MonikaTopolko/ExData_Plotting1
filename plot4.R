hpc_data <- read.table("./Project/household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors = FALSE, dec=".", na.strings="?")

hpc_subset <- hpc_data[hpc_data$Date %in% c("1/2/2007", "2/2/2007"), ]

date_time <- as.POSIXct(paste(hpc_subset$Date, hpc_subset$Time), format = "%d/%m/%Y %H:%M:%S")

global_active_power <- hpc_subset$Global_active_power
global_reactive_power <- hpc_subset$Global_reactive_power
voltage <- hpc_subset$Voltage
sub_metering1 <- hpc_subset$Sub_metering_1
sub_metering2 <- hpc_subset$Sub_metering_2
sub_metering3 <- hpc_subset$Sub_metering_3

png("plot4.png", width=480, height=480)
par(mfrow=c(2,2), mar=c(4,4,1,1))

plot(date_time, global_active_power, type="l", xlab="", ylab="Global Active Power")

plot(date_time, voltage, type="l", xlab="datetime", ylab="Voltage")

plot(date_time, sub_metering1, type="l", xlab="", ylab="Energy sub metering")
lines(date_time, sub_metering2, type="l", col="red")
lines(date_time, sub_metering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd= 2.5, col=c("black", "red", "blue"))

plot(date_time, global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()
