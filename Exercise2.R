#Firstly, we add data base of life cycle savings
data("LifeCycleSavings")
head(LifeCycleSavings)
rownames(LifeCycleSavings)
View(LifeCycleSavings)
#Then we see in the chart 
pairs(LifeCycleSavings)
#Use attach and show heading of the chart
attach(LifeCycleSavings)
#And Use some compare with this chart
plot(dpi, pop75, col = "red", main="75+ and disposal income")
plot(pop15, sr, col = "green", main="15- and personal savings")
plot(pop75, sr, type = "p", col = "blue", main="75+ and personal savings")
plot(dpi, pop15, col = "red", main="15- and disposal income")


