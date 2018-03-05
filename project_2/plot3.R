#! /usr/bin/Rscript

library(ggplot2)

##  Of the four types of sources indicated by the type (point, nonpoint,
##  onroad, nonroad) variable, which of these four sources have seen
##  decreases in emissions from 1999 - 2008 for Baltimore City? Which have
##  seen increases in emissions from 1999 - 2008? Use the ggplot2 plotting
##  system to make a plot answer this question.

##  Create data frames from provided datasets

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

##  aggregate emissions data by year

balt <- subset(NEI, fips == "24510")

##  library(ggplot2)
##  sub2 <- subset(NEI, fips == "24510")
##  balt.sources <- aggregate(sub2[c("Emissions")], list(type = sub2$type, year = sub2$year), sum)
##  qplot(year, Emissions, data = balt.sources, color = type, geom= "line")+ ggtitle("Total PM2.5 Emissions in Baltimore County by Source Type") + xlab("Year") + ylab("PM2.5 Emissions")              

balt_collectors <-aggregate(balt[c("Emissions")],
                                    list(type = balt$type,
                                    year = balt$year),
								    sum)

##  open png file as a plotting device

png(file="plot3.png")


qplot(year,
	  Emissions,
	  data=balt_collectors,
	  color=type,
	  geom="line",
	  main="Total PM2.5 emissions in Baltimore County, MD by source type",
	  xlab="Year",
	  ylab="PM2.5 Emissions",
	  )

dev.off()