#! /usr/bin/Rscript

##  Plot 5:
##
##  How have emissions from motor vehicle sources changed from 1999 -
##  2008 in Baltimore city?

library("tidyverse")

##  Create data frames from provided datasets

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

##  aggregate emissions data by year


balt_onroad <- filter(NEI,
                      fips == "24510",
                      type == "ON-ROAD") %>%
    group_by(year) %>%
    summarise(sum(Emissions))


png(file="plot5.png")

ggplot(x = balt_onroad$year,
      y = balt_onroad$`sum(Emissions)`,
      geom = c("line","point"),
      xlab= "Year",
      ylab= "Total emission from motor vehicles",
      main = "Baltimore city pollution(Motor vehicles)")



dev.off()

