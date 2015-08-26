nei<-readRDS("../data/summarySCC_PM25.rds")
scc<-readRDS("../data/Source_Classification_Code.rds")
library(dplyr)
scc_vehicle<-scc[grep(".*Mobile.*Vehicles",scc$EI.Sector),]
neiBalt<-nei[nei$fips == "24510",]
vehicle<-inner_join(neiBalt,scc_vehicle,by="SCC")
vehiclePpmByYear<-aggregate(vehicle$Emissions,by=list(vehicle$year),sum)
png(filename = "plot5.png",width=480,height=480,type="windows",pointsize = 12)
barplot(vehiclePpmByYear$x,1, main="Motor Vehicle PM2.5 Emissions in Baltimore City, MD",names.arg=c("1999","2002","2005","2008"),
        ylab="Tons of PM2.5 Emissions from Motor Vehicles",xlab="Year")
dev.off()
