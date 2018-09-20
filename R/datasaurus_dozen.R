# Load libraries (install if needed)
library(ggplot2)
library(datasauRus)
library(readr)

wwu <- read_csv('Skripte/Python/same-stats-different-graphs/wwu-data-rando.csv', col_types = cols(X1 = col_skip()))
wwu$dataset <- "wwu"
wwu <- wwu[,c(3,1,2)]

datasaurus <- rbind(datasaurus_dozen, wwu)

# Show descriptives for all datasets
# Result: All datasets are roughly equal
sets <- names(table(datasaurus$dataset))
for(i in sets) {
  set <- i
  cat(paste(set, ":", "\n",
          "X Mean: ", round(mean(subset(datasaurus, dataset == set)$x),2), " / ",
          "Y Mean: ", round(mean(subset(datasaurus, dataset == set)$y),2), " / ", 
          "X SD: ", round(sd(subset(datasaurus, dataset == set)$x),2), " / ",
          "Y SD: ", round(sd(subset(datasaurus, dataset == set)$y),2), " / ",
          "XY COR: ", round(cor(subset(datasaurus, dataset == set)$y, subset(datasaurus, dataset == set)$x),2),
          "\n\n",
          sep = ''))
}

# Plot datasets
# Result: Datasets differ vastly
ggplot(datasaurus, aes(x=x, y=y, colour=dataset))+
  geom_point()+
  theme_void()+
  theme(legend.position = "none")+
  facet_wrap(~dataset, ncol=3)