nei<-readRDS("../data/summarySCC_PM25.rds")
scc<-readRDS("../data/Source_Classification_Code.rds")
library(dplyr)
scc_coalcomb<-scc[grep(".*Comb.*Coal",scc$EI.Sector),]
coalcomb<-inner_join(nei,scc_coalcomb,by="SCC")
coalPpmByYear<-aggregate(coalcomb$Emissions,by=list(coalcomb$year),sum)
png(filename = "plot4.png",width=480,height=480,type="windows",pointsize = 12)
barplot(coalPpmByYear$x/1000,1, main="Coal Combustion PM2.5 Emissions",names.arg=c("1999","2002","2005","2008"),
        ylab="Tons of PM2.5 Emissions from Coal (thousands)",xlab="Year")
dev.off()
