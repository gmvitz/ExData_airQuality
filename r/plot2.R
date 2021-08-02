nea <- readRDS("data/summarySCC_PM25.rds")
scc <- readRDS("data/Source_Classification_Code.rds")

options(scipen = 5)

balt <- subset(nea, fips == "24510")

balt_em <- tapply(balt$Emissions, balt$year, sum)

png(file = "plots/plot2.png", width = 480, height = 480)
barplot(height = balt_em, names.arg = names(balt_em), main = "Baltimore Total Emissions in Each Year")
dev.off()
