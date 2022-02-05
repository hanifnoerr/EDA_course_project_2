# 4. Across the United States, how have emissions from coal combustion-related sources changed from 1999–2008?

# read df
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Creating Plot4
library(ggplot2) #load ggplot2 library
SCCcoal <- SCC[grepl("coal", SCC$Short.Name, ignore.case = T),]
NEIcoal <- NEI[NEI$SCC %in% SCCcoal$SCC,]
totalCoal <- aggregate(Emissions ~ year + type, NEIcoal, sum)

png(filename = "plot4.png", width=480, height=480) #to save the plot in g.colab directory
ggplot(totalCoal, aes(year, Emissions, col = type)) +
  geom_line() +
  geom_point() +
  ggtitle(expression("Total US" ~ PM[2.5] ~ "Coal Emission by Type and Year")) +
  xlab("Year") +
  ylab(expression("US " ~ PM[2.5] ~ "Coal Emission"))
dev.off()
