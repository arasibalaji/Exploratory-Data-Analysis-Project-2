# Loading datasets
NEI <- readRDS("C:/Users/arasi/Documents/R/Data/SummarySCC_PM25.rds")
SCC <- readRDS("C:/Users/arasi/Documents/R/Data/Source_Classification_Code.rds")

# Sampling
NEI_sampling <- NEI[sample(nrow(NEI), size=5000, replace=F), ]

# Subset data 
MD <- subset(NEI, fips=='24510')

# Generate the graph 
barplot(tapply(X=MD$Emissions, INDEX=MD$year, FUN=sum), 
        main='Total Emission in Baltimore City, MD', 
        xlab='Year', ylab=expression('PM'[2.5]))

dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()
