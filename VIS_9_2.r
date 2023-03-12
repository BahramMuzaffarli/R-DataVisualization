# Exercise

library(grid)
library(gridExtra)
library(ggplot2)

# Please embed all charts created in modules VIS_6 and VIS_8 in the views created # in grid.


###
pushViewport(viewport(layout=grid.layout(2, 2), gp=gpar(fill=NA, cex=0.5)))
pushViewport(viewport(layout.pos.col=1, layout.pos.row=1))
pushViewport(plotViewport(c(5, 4, 2, 2)))
pushViewport(dataViewport(mtcars$mpg, 
                          mtcars$cyl,
                          name="plotRegion"))

grid.points(mtcars$mpg, mtcars$cyl, 
            gp=gpar(cex=0.6))
grid.rect()
grid.xaxis()
grid.yaxis()
grid.text("mpg", y=unit(-3, "line"))
grid.text("cyl", x=unit(-3, "line"), rot=90)

popViewport(3)
pushViewport(viewport(layout.pos.col=2, layout.pos.row=1))
pushViewport(plotViewport(c(5, 4, 2, 2)))
pushViewport(dataViewport(mtcars$hp, 
                          mtcars$disp,
                          name="plotRegion"))

grid.points(mtcars$hp, mtcars$disp, pch=5, 
            gp=gpar(cex=0.6))
grid.rect()
grid.xaxis()
grid.yaxis()
grid.text("mpg", y=unit(-3, "line"))
grid.text("cyl", x=unit(-3, "line"), rot=90)


#
upViewport(2)
grid.rect(gp=gpar(lty="dashed"))

downViewport("plotRegion")
grid.text("Test",
          x=unit(150, "native"), y=unit(600, "native"))

###
grid.newpage()
pushViewport(viewport(x=0, width=0.3, just="left"))
print(ggplot(mtcars2, aes(y=mpg)) + 
        geom_bar(color='red'),
      newpage=FALSE)
popViewport()

pushViewport(viewport(x=0.3, width=0.6, just="left"))
print(ggplot(mtcars2, aes(x=disp, y=mpg)) +
        geom_point(aes(color=trans)) +
        scale_color_manual(values=gray(2:1/3)),
      newpage=FALSE)
popViewport()




###
a=ggplot(mtcars, aes(x = disp, y = mpg)) + 
  geom_point()
grid.draw(a)

b = ggplot(mtcars, aes(x = cyl)) + 
  geom_bar()
grid.draw(b)

c = ggplot(mtcars, aes(x = gear, y = disp)) + 
  geom_point()
grid.draw(c)

grid.arrange(a, b, c, ncol=3)
grid.arrange(a, b, c, ncol=1)

###
a1=ggplot(mtcars, aes(x = hp, y = disp)) + 
  geom_point()
grid.draw(a1)

b1 = ggplot(mtcars, aes(x = disp)) + 
  geom_bar(fill='blue')
grid.draw(b1)

c1 = ggplot(mtcars, aes(x = qsec, y = wt)) + 
  geom_point(fill='green')
grid.draw(c1)

grid.arrange(a1, b1, c1, ncol=3)
grid.arrange(a1, b1, c1, ncol=1)

#https://bookdown.org/rdpeng/RProgDA/the-grid-package.html
dev.off()




