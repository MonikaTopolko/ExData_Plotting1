hpc_data <- read.table("./Project/household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors = FALSE, dec=".", na.strings="?")

hpc_subset <- hpc_data[hpc_data$Date %in% c("1/2/2007", "2/2/2007"), ]

global_active_power <- hpc_subset$Global_active_power

png("plot1.png", width=480, height=480)

hist(global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", col="red")

dev.off()