#How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City?
#Subset and aggregrate vehicles AND Baltimore data
baltimore <-subset(NEI, NEI$fips=="24510" & NEI$type == "ON-ROAD")
baltimoreVehicles <- aggregate(Emissions ~ year, baltimore, sum)
#Plot
ggplot(baltimoreVehicles, aes(year, Emissions)) + geom_point() + geom_line() + ggtitle("Baltimore Motor Vehicle Emissions")