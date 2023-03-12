# Exercise.

library(grid)
library(gridExtra)

library(ggplot2movies)
library(ggplot2)
# Please modify charts created in modules VIS_6 and VIS_8 and add anotations, arrows and other graphical objects
# in grid package to make your charts more clear


# Load the Investment data and convert it to a data frame
data(Investment, package="sandwich")
Investment <- as.data.frame(Investment)

# Create the first scatter plot using grid.points and grid.lines
pushViewport(viewport(layout=grid.layout(2, 1), gp=gpar(cex=0.6, fill=NA)))
pushViewport(viewport(layout.pos.col=1, layout.pos.row=1))
pushViewport(plotViewport(c(5, 4, 2, 2)))
pushViewport(dataViewport(Investment$GNP, 
                          Investment$Investment,
                          name="plotRegion"))

grid.points(Investment$GNP, Investment$Investment, 
            gp=gpar(cex=0.5))

tg1 <- textGrob("GNP")
tg2 <- textGrob("Interest")
rg <- rectGrob(width=1.5*grobWidth(tg1), 
               height=3*grobHeight(tg1))
boxedText1 <- gTree(children=gList(tg1, rg))
boxedText2 <- gTree(children=gList(tg2, rg))


grid.rect(gp=gpar(col="blue"))
grid.xaxis()
grid.yaxis()
#grid.text("GNP", x=unit(-3, "line"), rot=90)
grid.draw(boxedText1)

popViewport(3)
pushViewport(viewport(layout.pos.row=2, layout.pos.col=1))
pushViewport(plotViewport(c(5, 4, 2, 2)))
pushViewport(dataViewport(Investment$Interest, 
                          Investment$Investment,
                          name="plotRegion"))

grid.points(Investment$Interest, Investment$Investment, pch=2, 
            gp=gpar(cex=0.5))
grid.rect(gp=gpar(col="red"))
grid.xaxis()
grid.yaxis()
grid.text("Investment", y=unit(-3, "line"))
#grid.text("Interest", x=unit(-3, "line"), rot=90)
grid.draw(boxedText2)
#----------------

update_geom_defaults("smooth", aes(color="black"))
print(
  ggplot(Investment, aes(x = GNP, y = Investment)) +
    geom_point(shape = 0)+geom_smooth(method=lm)
)


current.vpTree()
grid.force()
grid.ls()


downViewport("panel.6-4-6-4")


sline <- grid.get(gPath("smooth", "polyline"),
                  grep=TRUE)
grid.segments(.7, .8, 
              grobX(sline, 45), grobY(sline, 45),
              arrow=arrow(angle=10, type="closed"),
              gp=gpar(fill="black"))
 

grid.text("line of best fit", .71, .81,
          just=c("left", "bottom"))

# -----------------------------------------------
#VIS_8

?movies


movies$rounded_rating <- round(movies$rating)
movies$age <- NA
movies$age[movies$year < 2000] <- "old"
movies$age[movies$year >= 2000] <- "new"

gcLimits <- 
  data.frame(category=c("1900s",
                        "1950s",
                        "2000s"),
             limit=c(1900,1950, 2000))


pushViewport(plotViewport(c(5, 4, 2, 2)))

# Next view define the data layer.

pushViewport(dataViewport(movies$votes, 
                          movies$year,
                          name="plotRegion"))

# code below will add points to the defined views
grid.rect(gp=gpar(col="orange"))
grid.xaxis(gp=gpar(col="orange"))
grid.yaxis(gp=gpar(col="orange"))
grid.text("Votes ", y=unit(-3, "line"),gp=gpar(col="orange"))
grid.text("Year", x=unit(-3, "line"), rot=90,gp=gpar(col="orange"))
grid.points(movies$votes, movies$year, gp=gpar(cex=0.5,col="gray"))
grid.segments(0, 0.9150, 1, 0.9150,gp = gpar(col = "red", lwd = 2))
grid.segments(0, 0.5, 1, 0.5,gp = gpar(col = "blue", lwd = 2))
grid.segments(0, 0.2650, 1, 0.2650,gp = gpar(col = "green", lwd = 2))

