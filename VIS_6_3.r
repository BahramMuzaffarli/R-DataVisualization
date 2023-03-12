# Exercise.

# Please install sandwich package and execute the following code in R :

data(Investment, package="sandwich")
Investment <- as.data.frame(Investment)

# Investments in the USA, an annual time series from 1963 to 1982 with 7 variables. 

# Please investigate factors  related to investments in the USA, create visualization using lattice package.
library(sandwich)
library(lattice)
library(latticeExtra)
df = c(1963,1982)
years = seq(from = 1963, to = 1982)
years = as.numeric(years)

#Investment Loss 
loss =  round(Investment$RealInv - Investment$Investment,2)

fm = lm(RealInv ~ RealGNP + RealInt, data = Investment)
summary(fm)

plot(ts(residuals(fm), start = 1964),
     type = "b", pch = 19, ylim = c(-35, 35), ylab = "Residuals")
sigma <- sqrt(sum(residuals(fm)^2)/fm$df.residual)
abline(h = c(-2, 0, 2) * sigma, lty = 2)

## visualize fitted series
plot(Investment[, "RealInv"], type = "b", pch = 19, ylab = "Real investment")
lines(ts(fitted(fm), start = 1964), col = 4)


bwplot(Investment$Price~ Investment$Interest, pch=17 ,bg='red', xlab='Interest', ylab = 'Price', main="Interest and Price dependence")

histogram(~ Investment$RealInt, xlab='Investment', main="Investment and  Price", col = '6')

xyplot(Investment$RealGNP~Investment$GNP, col = "darkgreen", pch = 12, type = "b")

stripplot(Investment$Investment~Investment$RealInv,  data = ToothGrowth,
          jitter.data = TRUE, pch = 19,
          xlab = "RealInv", ylab = "Inv")

densityplot(~Investment$GNP,xlab = 'Gross National Product ' ,
            col = '8', main = ' Density of Gross National Product ', lwd = 2.5, plot.points = T)

dotplot(Investment$Investment~Investment$RealGNP|sigma, xlab = 'RealGNP', ylab = 'Investment',col = 'darkblue')

plot(Investment[, "RealInv"], type = "b", pch = 19, ylab = "Real investment")
lines(ts(fitted(fm), start = 1964), col = 4)

plot(Investment$GNP,pch=20, col = 'red', ylab = 'Gross of Product',  main = 'Plot of GNP')
abline(v=13,col="blue", h = 1500)
mtext('Significantly increase point show with lines', side = 3)

cloud(Investment$Investment~Investment$RealInv*Investment$Price|sigma, pch = 'O')

par(mfrow = c(3,3))
plot(Investment$GNP~years )
plot(Investment$Investment~years )
plot(Investment$Price~years )
plot(Investment$Interest~years )
plot(Investment$RealGNP~years )
plot(Investment$RealInv~years )
plot(Investment$RealInt~years )


dotplot(loss~years, main = 'Investment Loss', col = 'dark green')


dev.off()

