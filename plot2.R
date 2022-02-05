# 2. Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (\color{red}{\verb|fips == "24510"|}fips == "24510") from 1999 to 2008? Use the base plotting system to make a plot answering this question.
# read df
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# creating Plot2
baltimore <- subset(NEI, NEI$fips == "24510")
totalBaltimore <- aggregate(Emissions ~ year, baltimore, sum)

png(filename = "plot2.png", width=480, height=480) #to save the plot in g.colab directory
plot(totalBaltimore$year, totalBaltimore$Emissions, type = "l", 
  main = expression("Total Baltimore" ~ PM[2.5] ~ "Emissions by Year"), 
  xlab = "Year", 
  ylab = expression("Total Baltimore "~ PM[2.5] ~ "Emissions"))
dev.off()
