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

# open device
png(paste(path,"plot1.png",sep="/"),width=480,height=480,bg="transparent")

# Plot histogram
hist(data$Global_active_power,main="Global Active Power",xlab="Global Active Power (kilowatts)",col="red")

# close device
dev.off()
