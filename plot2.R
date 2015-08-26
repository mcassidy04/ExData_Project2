nei<-readRDS("../data/summarySCC_PM25.rds")
scc<-readRDS("../data/Source_Classification_Code.rds")
neiBalt<-subset(nei,fips == "24510",select=c(Emissions,type,year))
ppmByYearBaltimore<-aggregate(neiBalt$Emissions,by=list(neiBalt$year),sum)
png(filename = "plot2.png",width=480,height=480,type="windows",pointsize = 12)
barplot(ppmByYearBaltimore$x/1000000,1, main="Total PM2.5 Emissions",names.arg=c("1999","2002","2005","2008"),
        ylab="Tons of PM2.5 Emissions (millions)",xlab="Year")
dev.off()
