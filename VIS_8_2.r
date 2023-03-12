# Exercise.

library(ggplot2movies)
library(ggplot2)
data(movies)

#Pleasae analyse dataset movies available after installing package ggplot2movies
# 1. Please visualize main features of this dataset using ggplot2 package
# 2. Create chart with few panels characterising 3 most important fetaures of
# this dataset.


ggplot(movies,aes(x=rating))+
geom_histogram(binwidth=.1,color='coral',
                  fill='green',
                  alpha=0.6)+
  labs(x='Movie Rating',y='Frequency',
  title="User Ratings")

ggplot(movies,aes(x=year,y=rating))+
geom_density2d(color='brown4',lwd=1.2)+
  labs(title='Density of ratings per years')


ggplot(movies, aes(year, rating))+
geom_jitter(width = 0.25,height =0.25,color='darkgray',alpha=0.5)

ggplot(movies, aes(year, rating))+
  geom_boxplot(aes(group=year),color='blue')


ggplot(movies,aes(year))+
  geom_bar(color='black',fill='red')+
  labs(title='Frequency of Movies year',xlab='YEAR', ylab="Frequency")

ggplot(movies,aes(rating,votes))+
  geom_point(color='red',alpha=0.1)
                          
ggplot(movies, aes(length, votes, colour = factor(Comedy))) + 
  geom_point()+
  geom_hline(yintercept=50000,lwd=1.1,color='deeppink')

ggplot(movies,aes(x=year,y=rating))+
  geom_bin2d(binwidth=c(3,1))+
  scale_fill_gradient(high = 'red',low = 'green')+
  labs(title='Geombin2d graph',xlab='Years',ylab=Ratings)
