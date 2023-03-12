#two files on niezbednik
#1 file - R code (script in R)
#2 file - report with graphs and short description

LifeCycleSavings
attach(LifeCycleSavings)
rownames(LifeCycleSavings)

#relation between people under 15 and disposable income
plot(dpi, pop15, pch = 1, col = "black")
cor(dpi,pop15)

#relation between people people under 15 and personal savings
plot(sr, pop15, pch = 1, col = "black")
cor(sr,pop15)

#relation between people over 75 and disposable income
plot(dpi, pop75, pch = 1, col = "black")
cor(dpi, pop75)

#relation between people over 75 and personal savings
plot(sr, pop75, pch = 1, col = "black")
cor(sr,pop75)

#relation between income and savings
plot(sr~dpi, xlim = c(0, 4100), xlab = 'Disposable Income', ylab = 'Savings', main = 'Life-Cycle Savings', data = LifeCycleSavings[1:50,])
with(LifeCycleSavings[1:50,], text(sr~dpi, labels = row.names(LifeCycleSavings[1:50,]), pos = 4))

#age of population
plot(pop75~pop15, xlim = c(0, 50), xlab = 'under15', ylab = 'over75', main = 'Age of population', data = LifeCycleSavings[1:50,])
with(LifeCycleSavings[1:50,], text(pop75~pop15, labels = row.names(LifeCycleSavings[1:50,]), pos = 4))
