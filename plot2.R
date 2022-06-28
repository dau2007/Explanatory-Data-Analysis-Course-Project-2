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