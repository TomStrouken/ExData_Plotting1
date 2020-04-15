## download data into R.
household_power <- read.table("./household_power_consumption.txt", stringsAsFactors = FALSE, header = TRUE, sep =";"  )

## create column where date and time are merged
FullTimeDate <- strptime(paste(household_power$Date, household_power$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
household_power <- cbind(household_power, FullTimeDate)

## change class of dates
household_power$Date <- as.Date(household_power$Date, format="%d/%m/%Y")

## subset the dates between 2007-02-01 and 2007-02-02
subset_household_power <- subset(household_power, Date == "2007-02-01" | Date =="2007-02-02")

## change the class of the rest of the variables
subset_household_power$Time <- format(subset_household_power$Time, format="%H:%M:%S")
subset_household_power$Global_active_power <- as.numeric(subset_household_power$Global_active_power)
subset_household_power$Global_reactive_power <- as.numeric(subset_household_power$Global_reactive_power)
subset_household_power$Voltage <- as.numeric(subset_household_power$Voltage)
subset_household_power$Global_intensity <- as.numeric(subset_household_power$Global_intensity)
subset_household_power$Sub_metering_1 <- as.numeric(subset_household_power$Sub_metering_1)
subset_household_power$Sub_metering_2 <- as.numeric(subset_household_power$Sub_metering_2)
subset_household_power$Sub_metering_3 <- as.numeric(subset_household_power$Sub_metering_3)

## send the plot to a png file
png("plot3.png", width=480, height=480)

## create the graph
with(subset_household_power, {
        plot(Sub_metering_1~FullTimeDate, type="l",
             ylab="Global Active Power (kilowatts)", xlab="")
        lines(Sub_metering_2~FullTimeDate,col='Red')
        lines(Sub_metering_3~FullTimeDate,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## reset the graphic device
dev.off()