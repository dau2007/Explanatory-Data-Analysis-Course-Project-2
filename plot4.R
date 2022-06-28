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