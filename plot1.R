# 1. Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? Using the base plotting system, make a plot showing the total PM2.5 emission from all sources for each of the years 1999, 2002, 2005, and 2008.

# read df
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# creating Plot1
sum_by_year <- aggregate(NEI$Emissions, by=list(year=NEI$year), FUN=sum)

png(filename = "plot1.png", width=480, height=480) #to save the plot in g.colab directory
plot(sum_by_year$year, sum_by_year$x, type = "l", 
  main = "Total US "~   PM[2.5] ~ "Emissions by Year",
  ylab = "Total US "~   PM[2.5] ~ "Emissions",
  xlab = "Year")
dev.off()
