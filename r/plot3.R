library(ggplot2)

nea <- readRDS("data/summarySCC_PM25.rds")
scc <- readRDS("data/Source_Classification_Code.rds")

options(scipen = 5)

balt <- subset(nea, fips == "24510")

plot <- ggplot(balt, aes(x = year, y = Emissions)) +
    stat_summary(fun = "sum", geom = "bar") + 
    facet_grid(rows = vars(type))

ggsave("plots/plot3.png", plot = plot, width = 4, height = 4)

