# Explanatory-Data-Analysis-Course-Project-2
setwd("~/GitHub/exdata_data_NEI_data")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
aggregateTotals <- aggregate(Emissions ~ year,NEI, sum)
aggregate
#Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? Using the base plotting system, make a plot showing the total PM2.5 emission from all sources for each of the years 1999, 2002, 2005, and 2008
barplot(
  (aggregateTotals$Emissions)/10^6,
  names.arg=aggregateTotals$year,
  xlab="Year",
  ylab="PM2.5 Emissions (10^6 Tons)",
  main="Total PM2.5 Emissions From All US Sources"
)

#Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510"\color{red}{\verb|fips == "24510"|}fips == "24510") from 1999 to 2008? Use the base plotting system to make a plot answering this question
baltimoreNEI <- NEI[NEI$fips=="24510",]
aggregateTotalsBaltimore <- aggregate(Emissions ~ year, baltimoreNEI,sum)
barplot(
  aggregateTotalsBaltimore$Emissions,
  names.arg=aggregateTotalsBaltimore$year,
  xlab="Year",
  ylab="PM2.5 Emissions (Tons)",
  main="Total PM2.5 Emissions From All Baltimore City Sources"
)


#Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510"\color{red}{\verb|fips == "24510"|}fips == "24510") from 1999 to 2008? Use the base plotting system to make a plot answering this question
baltimoreNEI <- NEI[NEI$fips=="24510",]
aggregateTotalsBaltimore <- aggregate(Emissions ~ year, baltimoreNEI,sum)
barplot(
  aggregateTotalsBaltimore$Emissions,
  names.arg=aggregateTotalsBaltimore$year,
  xlab="Year",
  ylab="PM2.5 Emissions (Tons)",
  main="Total PM2.5 Emissions From All Baltimore City Sources"
)

#Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510"\color{red}{\verb|fips == "24510"|}fips == "24510") from 1999 to 2008? Use the base plotting system to make a plot answering this question
baltimoreNEI <- NEI[NEI$fips=="24510",]
aggregateTotalsBaltimore <- aggregate(Emissions ~ year, baltimoreNEI,sum)
barplot(
  aggregateTotalsBaltimore$Emissions,
  names.arg=aggregateTotalsBaltimore$year,
  xlab="Year",
  ylab="PM2.5 Emissions (Tons)",
  main="Total PM2.5 Emissions From All Baltimore City Sources"
)

#Across the United States, how have emissions from coal combustion-related sources changed from 1999–2008?
Relatedcombustion <- grepl("comb", SCC$SCC.Level.One, ignore.case=TRUE)
Relatedcoal <- grepl("coal", SCC$SCC.Level.Four, ignore.case=TRUE) 
Combustioncoal <- (Relatedcombustion & Relatedcoal)
SCCcombustion <- SCC[Combustioncoal,]$SCC
NEIcombustion <- NEI[NEI$SCC %in% SCCcombustion,]

library(ggplot2)
ggem <- ggplot(NEIcombustion,aes(factor(year),Emissions/10^5)) +
  geom_bar(stat="identity",fill="grey",width=0.75) +
  theme_bw() +  guides(fill=FALSE) +
  labs(x="year", y=expression("Total PM"[2.5]*" Emission (10^5 Tons)")) + 
  labs(title=expression("PM"[2.5]*" Coal Combustion Source Emissions Across US from 1999-2008"))
  
  
  #How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City?
#Subset and aggregrate vehicles AND Baltimore data
baltimore <-subset(NEI, NEI$fips=="24510" & NEI$type == "ON-ROAD")
baltimoreVehicles <- aggregate(Emissions ~ year, baltimore, sum)
#Plot
ggplot(baltimoreVehicles, aes(year, Emissions)) + geom_point() + geom_line() + ggtitle("Baltimore Motor Vehicle Emissions")

#Compare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle sources in Los Angeles County, California (fips == "06037"\color{red}{\verb|fips == "06037"|}fips == "06037"). Which city has seen greater changes over time in motor vehicle emissions?
baltLAMotors <- subset(NEI, NEI$fips %in% c("24510","06037") & NEI$type == "ON-ROAD")
baltLAMotorsAGG <- aggregate(Emissions ~ year + fips, baltLAMotors, sum)
#plot
ggplot(baltLAMotorsAGG, aes(year, Emissions, col = fips)) +
  geom_line() +
  geom_point() +
  ggtitle(expression("Baltimore and Los Angeles" ~ PM[2.5] ~ "Motor Vehicle Emissions by Year")) +
  labs(x = "Year", y = expression(~PM[2.5]~ "Motor Vehicle Emissions") ) +
  scale_colour_discrete(name = "City", labels = c("Los Angeles", "Baltimore")) +
  theme(legend.title = element_text(face = "bold"))


