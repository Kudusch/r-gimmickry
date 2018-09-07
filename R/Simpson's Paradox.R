# Simpson's Paradox

# Set up config
randomness <- 80

# Generate a series of measurements of interval data in two experiments
# Experiment one
a <- c()
for(i in 100:1) {
  n <- i*1.5
  a <- c(a, n+runif(1,randomness*-1,randomness))
}
a <- data.frame(a,'a')
names(a) <- c('value', 'experiment')
# Experiment two
b <- c()
for(i in ((300):(201))) {
  n <- i*1.5
  b <- c(b, n+runif(1,randomness*-1,randomness))
}
b <- data.frame(b,'b')
names(b) <- c('value', 'experiment')
# Combine the results of both experiments
df <- rbind(a, b)

# Fit and test combined experiments
# Result: There is a significant, positive relationship
fitAll<- lm(1:length(df$value)~df$value);fitAll
cor.test(1:length(df$value), df$value)

# Fit experiment one and two
fitA <- lm(1:length(subset(df, df$experiment == 'a')$value)~subset(df, df$experiment == 'a')$value); fitA
fitB <- lm(1:length(subset(df, df$experiment == 'b')$value)~subset(df, df$experiment == 'b')$value); fitB

# Plot to show that the positive relationship only exists between the groups, 
# not within the groups
library(ggplot2)
ggplot(df, aes(x=1:length(df$value), y=df$value, color = df$experiment)) +
  geom_point(shape=1) +
  geom_smooth(method='lm') +
  geom_abline(intercept = fitAll$coefficients[1]) +
  labs(title = "", y = "", x = "", color = "Experiments")

# Clean up
rm(a, b, df, fitA, fitAll, fitB, i, randomness, n)