# Load libraries (install if needed)
library(ggplot2)
library(datasauRus)

# Show descriptives for all datasets
# Result: All datasets are roughly equal
sets <- names(table(datasaurus_dozen$dataset))
for(i in sets) {
set <- i
cat(paste(set, ":", "\n",
          "X Mean: ", round(mean(subset(datasaurus_dozen, dataset == set)$x),2), " / ",
          "Y Mean: ", round(mean(subset(datasaurus_dozen, dataset == set)$y),2), " / ", 
          "X SD: ", round(sd(subset(datasaurus_dozen, dataset == set)$x),2), " / ",
          "Y SD: ", round(sd(subset(datasaurus_dozen, dataset == set)$y),2), " / ",
          "XY COR: ", round(cor(subset(datasaurus_dozen, dataset == set)$y, subset(datasaurus_dozen, dataset == set)$x),2),
          "\n\n",
          sep = ''))
}

# Plot datasets
# Result: Datasets differ vastly
ggplot(datasaurus_dozen, aes(x=x, y=y, colour=dataset))+
  geom_point()+
  theme_void()+
  theme(legend.position = "none")+
  facet_wrap(~dataset, ncol=3)