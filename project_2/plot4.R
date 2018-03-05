#! /usr/bin/Rscript

library("tidyverse")

##  Of the four types of sources indicated by the type (point, nonpoint,
##  onroad, nonroad) variable, which of these four sources have seen
##  decreases in emissions from 1999 - 2008 for Baltimore City? Which have
##  seen increases in emissions from 1999 - 2008? Use the ggplot2 plotting
##  system to make a plot answer this question.

##  Create data frames from provided datasets

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

##  aggregate emissions data by year


SCC_coal <- SCC[grep("Coal" , SCC$Short.Name), ]
NEI_coal <- NEI[NEI$SCC %in% SCC_coal$SCC, ]

png(file="plot4.png")


p <- ggplot(NEI_coal,
	        aes( x = factor(year),
         		 y = Emissions,
	     		 fill = type,
	     		 xlab = "Year",
	     		 ylab = "Coal-Related PM2.5 Emissions")) +
				 geom_bar(stat = "identity",
					  			  width=.5,
								  main="Total Coal-Related PM2.5 Emissions")

plot(p)


dev.off()
