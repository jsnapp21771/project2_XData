#! /usr/bin/Rscript


##  Create data frames from provided datasets

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

##  aggregate emissions data by year


##  Using the base plotting system, make a plot showing the total
##  PM2.5 emission from all sources for each of the years 1999, 2002,
##  2005, and 2008.


emissions_agg <- with(NEI, aggregate(Emissions, by = list(year), sum))


##  open png file as a plotting device

png(file="plot1.png")


plot(emissions_agg,
	xlab = "Year",
	lwd = 3,
	ylab = "PM2.5 Emissions",
	type = "o",
	pch = 19,
	fg = "#888888",
	col = "#4444AA",
	lty = 1)

title(main="Total PM2.5 emissions by year")

dev.off()