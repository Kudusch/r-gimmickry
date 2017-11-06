# Simpson's Paradox

# Set up vars
experiment <- c()
experiment_one <- c()
experiment_two <- c()

# Generate a series of measurements of interval data in two experiments
# Experiment one
for(i in 100:1) {
  n <- i*1.5
  experiment_one <- c(experiment_one, n+runif(1,-80,80))
}
# Experiment two
for(i in 300:201) {
  n <- i*1.5
  experiment_two <- c(experiment_two, n+runif(1,-80,80))
}
# Combine the results of both experiments
experiment <- c(experiment_one,experiment_two)

# Fit and test combined experiments
# Result: There is a significant, positive relationship
fitAll<- lm(1:length(experiment)~experiment);fitAll
cor.test(1:length(experiment),experiment)

# Fit experiment one and two
fitOne <- lm(1:length(experiment_one)~experiment_one)
fitTwo <- lm(1:length(experiment_two)~experiment_two)

# Plot to show that the positive relationship only exists between the groups, 
# not within the groups
plot(1:length(experiment)~experiment)
abline(fitAll, col="blue")
abline(fitOne, col="red")
abline(fitTwo$coefficients[1]+100,fitTwo$coefficients[2], col="red")