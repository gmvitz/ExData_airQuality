library(ggplot2)

nea <- readRDS("data/summarySCC_PM25.rds")
scc <- readRDS("data/Source_Classification_Code.rds")

options(scipen = 5)

mv <- scc[grepl("Mobile", scc$EI.Sector),]

mv_data <- nea[(nea$SCC %in% mv$SCC) & nea$fips == "24510", ]

balt_mv_em <- tapply(mv_data$Emissions, mv_data$year, sum)

png(file = "plots/plot5.png", width = 480, height = 480)
barplot(height = balt_mv_em, names.arg = names(balt_mv_em), main = "Baltimore Motor Vehicle Emissions in Each Year")
dev.off()
