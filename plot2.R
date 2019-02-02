hpc_data <- read.table("./Project/household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors = FALSE, dec=".", na.strings="?")

hpc_subset <- hpc_data[hpc_data$Date %in% c("1/2/2007", "2/2/2007"), ]

date_time <- as.POSIXct(paste(hpc_subset$Date, hpc_subset$Time), format = "%d/%m/%Y %H:%M:%S")

global_active_power <- hpc_subset$Global_active_power

png("plot2.png", width=480, height=480)

plot(x = date_time, y= global_active_power, type = "l", xlab="", ylab="Global Active Power (kilowatts)")

dev.off()
