# Exercise.

library(ggplot2)
?economics
data(economics)
# 1. Please analyse using visual technics #economics dataset available in package # ggplot2.
# 2. Visualize charasteristics of this dataset.
# 3. Create bublechart for 3 variables of this dataset.

expenditure = economics$pce
pop = economics$pop
saving = economics$psavert
unemtime = economics$uempmed
unem = economics$unemploy

### Number of Unemployed Over Time

ggplot(economics,aes(x = date, y = unemploy)) +
  geom_point(aes(color =uempmed)) +
  labs(x = "Date",
       y = "Unemployment",
       title = "Number of Unemployed Over Time") +
  theme_bw()

#Individual Saving per Year
ggplot(economics) +
  geom_bar(aes(x = date, y = psavert, fill = pop), stat = 'identity') +
  labs(x = "Date",
       y = "Personal Savings Rate",
       fill = 'population',
       title = "How much an individual is Saving Per Year") +
  theme_bw()

#Average duration of unemployment per weeks
hist=ggplot(economics,aes(unemtime))
hist+geom_histogram(binwidth = 1,fill='red',colour='black')+
labs(x='Unemployed time duration',  title = "Weekly average duration time of unemployment")




#Unemployers over whole population
UnemPop <- ggplot(economics, aes(unem,pop))
UnemPop + geom_point(colour='darkblue',size=2, shape=20)+
labs(x='Unemployer',y='Population',title='Unemployers over whole population')


#in below not finish
m = mean(unem)
MeanUnemployment = ggplot(economics,aes(x=unemtime,y=m))
MeanUnemployment + geom_bar(stat='identity',fill = 'red', colour='5',size=1)


ggplot(economics,aes(x=pop,fill=date)) + geom_histogram(color='coral1',alpha=0.8,position ='identity')+
scale_fill_manual(values=c(saving, unem)) +labs(x = "Population", y = "Unemployment Persons", title = "Number of Unemployed ")+
theme_bw()




ggplot(economics, aes(x=saving)) + geom_density(color='blue', alpha=0.8,lwd=3)+
  labs(title='Savings Density',x='Savings')


gi=ggplot(economics, aes(date,expenditure))
gi + geom_boxplot(varwidth=T,colour='black',bg='red')+
labs(title="Box plot", 
     subtitle="Expenditure by date",
     caption="Source: economics",
     x="Date",
     y="Saving")
# labs(subtitle = 'expenditure vs mean unem time',title='bubble chart')) 
# geom_jitter(aes(col=pop,size=hwy))
# geom_smooth(aes(col=pop,method='lm',se = F))




#bubble chart
# Creating bublechart in graphics



# Step 2. Creating circles with size related to third variable (in this case # population)

symbols(saving, expenditure, circles=pop)

# Step 3. Creating circles related to radius

 #radius <- sqrt( crime$pop/ pi )
 #symbols(pop, unem, circles=radius)

# Step 4.Calibrating size of circles and adding colours

 #symbols(expenditure, saving,fg="gray", bg="purple", xlab="expenditure", ylab="saving")

# Step 5. Adding text labels

 
#text(expenditure, saving, unemtime, cex=1)

bubble=ggplot(economics, aes(x=expenditure, y=unem, size=pop, label=date))

bubble  + geom_point(colour="black", fill="purple", shape=1)+ scale_size_area(max_size = 15)+
  scale_x_continuous(name="Expenditure")+
  scale_y_continuous(name="Unemployment Persons")+
  geom_text(size=2)+
  theme_bw()
