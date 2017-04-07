#  Read Data 
NEI <- readRDS("C:/Users/arasi/Documents/R/Data/SummarySCC_PM25.rds")
SCC <- readRDS("C:/Users/arasi/Documents/R/Data/Source_Classification_Code.rds")

#  Create Data 
BC <- subset(NEI, fips == "24510") 
pd <- aggregate(BC[c("Emissions")], list(type = BC$type, year = BC$year), sum)

#  Create Plot

p <- ggplot(pd, aes(x=year, y=Emissions, colour=type)) +
  geom_point(alpha=.3) +
  geom_smooth(alpha=.2, size=1, method="loess") +
  ggtitle("Total Emissions by Type in Baltimore City")

print(p)
dev.copy(png, file="plot3.png", height=500, width=800, units='px')
dev.off()