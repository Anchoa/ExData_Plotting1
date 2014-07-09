# set relative path
path <- "ExData_Plotting1"

if(!file.exists(path))
{
    dir.create(path)
}

# data url
url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"

# dowload zip file
download.file(url,paste(path,"dataset.zip",sep="/"),method="curl")

# unzip
unzip(paste(path,"dataset.zip",sep="/"),exdir=path)

# Load file with separator ';' and '?' as NAs
# Take a subset: dates 1/2/2007 and 2/2/2007
data <- subset(read.csv(paste(path,"household_power_consumption.txt",sep="/"),sep=";",na.strings="?"), Date=="1/2/2007" | Date=="2/2/2007")

# compute posix timestamp
data$Timestamp <- strptime(paste(data$Date,data$Time,sep=" "),format="%d/%m/%Y %H:%M:%S")

# date labels in English (my locale is 'ca_ES.UTF-8@valencia')
Sys.setlocale("LC_TIME","en_GB.UTF-8")

# open device
png(paste(path,"plot2.png",sep="/"),width=480,height=480,bg="transparent")

# Plot 2
with(data,plot(Timestamp,Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)"))

# close device
dev.off()
