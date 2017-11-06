# Simpson's Paradox

#rm(list=ls())
x <- c()
a <- c()
b <- c()
# Generate data
for(i in 100:1) {
  n <- i*1.5
  a <- c(a, n+runif(1,-80,80))
}
for(i in 300:201) {
  n <- i*1.5
  b <- c(b, n+runif(1,-80,80))
}
x <- c(a,b)

# Fit and test both
fitX <- lm(1:length(x)~x);fitX
cor.test(1:length(x),x)

# Fit a and b
fitA <- lm(1:length(a)~a)
fitB <- lm(1:length(b)~b)


# Plot
plot(1:length(x)~x)
abline(fitX, col="blue")
abline(fitA, col="red")
abline(fitB$coefficients[1]+100,fitB$coefficients[2], col="red")