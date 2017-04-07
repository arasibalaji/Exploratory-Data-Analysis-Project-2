# Load the NEI and SCC data frames 
NEI <- readRDS("C:/Users/arasi/Documents/R/Data/SummarySCC_PM25.rds")
SCC <- readRDS("C:/Users/arasi/Documents/R/Data/Source_Classification_Code.rds")

# Sampling

NEI_sampling <- NEI[sample(nrow(NEI), size=2000, replace=F), ]

# Aggregate by sum the total emissions by Year

Emissions <- aggregate(NEI[, 'Emissions'], by=list(NEI$year), FUN=sum)
Emissions$PM <- round(Emissions[,2]/1000,2)

# Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? 
# Using the base plotting system, make a plot showing the total PM2.5 emission from all sources 
# for each of the years 1999, 2002, 2005, and 2008.
# Generate the graph in the same directory as the source code

barplot(Emissions$PM, names.arg=Emissions$Group.1, 
        main=expression('Total Emission of PM'[2.5]),
        xlab='Year', ylab=expression(paste('PM', ''[2.5], ' in Kilotons')))
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()