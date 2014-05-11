#
# Code for the Course project week 1 Plot 1
# as part of the Coursera course Exploratory Data Ananlysis
#
# P.A. Nommensen
# 2014-05-09
#


# load data
dirname  <- "./data/exdata_data_household_power_consumption"
filename <- paste(dirname, "household_power_consumption.txt", sep="/")
hsp <- read.table(filename, header=TRUE, sep=";", na.strings = "?")

hsp <- transform(hsp, Date=as.Date(Date, format="%d/%m/%Y"), 
                 Time=strptime(paste(Date, Time), format='%d/%m/%Y %H:%M:%S'))

# select valid dates
selDates <- as.Date(c("2007-02-01", "2007-02-02"))
hspSub <- subset(hsp, Date %in% selDates)

# plot Plot 1

png(filename = "figures/plot1.png", width = 480, height = 480)
hist(hspSub$Global_active_power,
     col="red",
     main = "Global Active Power",
     xlab = " Global Active Power (kilowatts)",
     cex.lab=0.9,
     cex.main = 1
     )

dev.off()