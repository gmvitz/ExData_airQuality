library(ggplot2)

nea <- readRDS("data/summarySCC_PM25.rds")
scc <- readRDS("data/Source_Classification_Code.rds")

options(scipen = 5)

coal <- scc[grepl("Coal", scc$EI.Sector),]

coal_data <- nea[nea$SCC %in% coal$SCC, ]

coal_em <- tapply(coal_data$Emissions, coal_data$year, sum)

png(file = "plots/plot4.png", width = 480, height = 480)
barplot(height = coal_em, names.arg = names(coal_em), main = "Coal Combustion Emissions in Each Year")
dev.off()
