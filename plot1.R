## download data into R.
household_power <- read.table("./household_power_consumption.txt", stringsAsFactors = FALSE, header = TRUE, sep =";"  )

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
png("plot1.png", width=480, height=480)

## create the histogram
hist(subset_household_power$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

## reset the graphic device
dev.off()
