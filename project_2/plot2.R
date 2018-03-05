#! /usr/bin/Rscript


##  Create data frames from provided datasets

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

##  aggregate emissions data by year

balt <- subset(NEI, fips == "24510")

balt_agg <- tapply(balt$Emissions, balt$year, sum)

##  open png file as a plotting device

png(file="plot2.png")


plot(balt_agg,
	type = "o",
	xlab = "Year",
	ylab = "PM2.5 Emissions",
	pch = 19,
	fg = "#888888",
	col = "#4444AA",
	lwd = 3,
	lty = 1)


title(main="PM2.5 emissions by year in Baltimore County, MD")
dev.off()