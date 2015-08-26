nei<-readRDS("../data/summarySCC_PM25.rds")
scc<-readRDS("../data/Source_Classification_Code.rds")
library(dplyr)
scc_vehicle<-scc[grep(".*Mobile.*Vehicles",scc$EI.Sector),]
neiLABalt<-subset(nei,fips == "24510"|fips == "06037",select=c(SCC,Emissions,fips,year))
#vehicleLABalt$year<-factor(vehicleLABalt$year)
vehicleLABalt<-inner_join(neiLABalt,scc_vehicle,by="SCC")
vehiclePpmLABaltsum<-aggregate(vehicleLABalt[,c("Emissions","fips","year")],by=list("year","fips"),sum)
vehiclePpmLABaltsum$Year<-factor(vehiclePpmLABaltsum$Year)
library(ggplot2)
png(filename = "plot6.png",width=480,height=480,type="windows",pointsize = 12)
p <- 
    ggplot(vehiclePpmLABaltsum, aes(Year,Emissions),fill=factor(fips)) + geom_bar(stat="identity")
dev.off()
