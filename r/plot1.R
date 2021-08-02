
nea <- readRDS("data/summarySCC_PM25.rds")
scc <- readRDS("data/Source_Classification_Code.rds")

options(scipen = 5)

total_emissions <- tapply(nea$Emissions, nea$year, sum)

png(file = "plots/plot1.png", width = 480, height = 480)
barplot(height = total_emissions, names.arg = names(total_emissions), main = "Total Emissions in Each Year")
dev.off()

