# 5. How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City?

# read df
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Creating Plot5
library(ggplot2) #load ggplot2 library
baltimoreMotor <- subset(NEI, NEI$fips == "24510" & NEI$type == "ON-ROAD")
baltimoreMotorAGG <- aggregate(Emissions ~ year, baltimoreMotor, sum)

png(filename = "plot5.png", width=480, height=480) #to save the plot in g.colab directory
ggplot(baltimoreMotorAGG, aes(year, Emissions)) +
  geom_line(col = "steelblue3") +
  geom_point(col = "steelblue3") +
  ggtitle(expression("Baltimore " ~ PM[2.5] ~ "Motor Vehicle Emissions by Year")) +
  xlab("Year") +
  ylab(expression(~PM[2.5]~ "Motor Vehicle Emissions"))
dev.off()
