#  Loading Data
NEI <- readRDS("C:/Users/arasi/Documents/R/Data/SummarySCC_PM25.rds")
SRC <- readRDS("C:/Users/arasi/Documents/R/Data/Source_Classification_Code.rds")

#  Create Data
CC <- grep("coal",SRC$EI.Sector,value=T,ignore.case=T)
SRC.CC <- subset(SRC, SRC$EI.Sector %in% CC, select=SCC)
NEI.CC <- subset(NEI, NEI$SCC %in%  SRC.CC$SCC)
pd <- aggregate(NEI.CC[c("Emissions")], list(year = NEI.CC$year), sum)

#  Create Plot
p <- ggplot(pd, aes(x=year, y=Emissions)) +
    geom_point(alpha=.3) +
    geom_smooth(alpha=.2, size=1) +
    ggtitle("Total PM2.5 Coal Combustion Emissions in the US")

print(p)
dev.off()