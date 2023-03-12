# Exercise.
library(gridExtra)
library(grid)
library(ggplot2)


# Please modify charts created in modules VIS_6 and VIS_8 and add anotations, arrows and other graphical objects
# in grid package to make your charts more clear





ggplot(movies,aes(year,votes))+
  geom_point(color='gray9')+
  geom_segment(aes(x = 1920,
                   y = 10000,
                   xend = 1990,
                   yend = 50000),color='darkblue',size=1.5,
               arrow = arrow(length = unit(1, "cm")))

###
ggplot(movies,aes(year))+
  geom_bar(color='black',fill='red')+
  labs(title='Frequency of Movies year',xlab='YEAR', ylab="Frequency")+
  geom_segment(aes(x = 1950,
                   y = 2000,
                   xend = 2000,
                   yend = 2150),
               arrow = arrow(length = unit(1.5, "cm")))

###
ggplot(movies,aes(x=year,y=rating))+
  geom_density2d(color='brown4',lwd=1.2)+
  annotate("text", x = 1969, y = 6, label = "Density of ratings per years")

ggplot(movies,aes(rating,votes))+
  geom_point(color='red',alpha=0.1)+
  annotate("text", x = 3, y = 25000, label = "Lowest IMDB Ratings",colour='darkblue')+
  annotate("text", x = 7, y = 80000, label = "Highest IMDB Ratings",colour='blue3')
  

###
ggplot(movies,aes(x=rating))+
  geom_histogram(binwidth=.1,color='coral',
                 fill='green',
                 alpha=0.6)+
  labs(x='Movie Rating',y='Frequency',
       title="User Ratings")+
  annotate("rect", xmin = 5, xmax = 8, ymin = 1500, ymax = 1800,
           alpha = .3)

###
ggplot(movies, aes(year, rating))+
  geom_jitter(width = 0.25,height =0.25,color='darkgray',alpha=0.5)+
  annotate("segment", x =1890 , xend = 1920, y = 0, yend = 3,
           colour = "blue")

ggplot(movies, aes(length, votes, colour = factor(Comedy))) + 
  geom_point()+
  geom_hline(yintercept=50000,lwd=1.1,color='deeppink')+
  annotate("pointrange", x = 60, y = 75000, ymin = 50000, ymax = 120000,
         colour = "red", size = 2.5, linewidth = 1.5)+
  



dev.off()



