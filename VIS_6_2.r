# Lattice Extra package 

library(latticeExtra)


# Program 1 - edcfplot displays of Cumulative Distribution Functions

data(singer, package = "lattice")
ecdfplot(~height | voice.part, data = singer)


# Program 2 - segplot - drawing segments

data(USCancerRates)
segplot(reorder(factor(county), rate.male) ~ LCL95.male + UCL95.male,
data = subset(USCancerRates, state == "Washington"))

segplot(reorder(factor(county), rate.male) ~ LCL95.male + UCL95.male,
data = subset(USCancerRates, state == "Washington"),
draw.bands = FALSE, centers = rate.male)

segplot(reorder(factor(county), rate.male) ~ LCL95.male + UCL95.male,
data = subset(USCancerRates, state == "Washington"),
level = rate.female, col.regions = terrain.colors)

segplot(reorder(factor(county), rate.male) ~ LCL95.male + UCL95.male,
data = subset(USCancerRates, state == "Washington"),
draw.bands = FALSE, centers = rate.male,
segments.fun = panel.arrows, ends = "both",
angle = 90, length = 1, unit = "mm")


# Program 3 panel.xyarea - cutting graph

xyplot(sunspot.year, panel = panel.xyarea, origin = 0,
aspect = "xy", cut = list(n = 4, overlap = 0))






































