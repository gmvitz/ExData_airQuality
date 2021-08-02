nea <- readRDS("data/summarySCC_PM25.rds")
scc <- readRDS("data/Source_Classification_Code.rds")

options(scipen = 5)

mv <- scc[grepl("Mobile", scc$EI.Sector),]

balt_data <- nea[(nea$SCC %in% mv$SCC) & nea$fips == "24510", ]
la_data <- nea[(nea$SCC %in% mv$SCC) & nea$fips == "06037", ]

balt_mv_em <- tapply(balt_data$Emissions, balt_data$year, sum)
la_mv_em <- tapply(la_data$Emissions, la_data$year, sum)

png(file = "plots/plot6.png", width = 480, height = 480)
par(mfrow = c(1,2))
barplot(height = balt_mv_em, names.arg = names(balt_mv_em), main = "Baltimore Motor Vehicle Emissions in Each Year")
barplot(height = la_mv_em, names.arg = names(la_mv_em), main = "LA Motor Vehicle Emissions in Each Year")
dev.off()
