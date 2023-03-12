library(maps)
#---------------------------------------------------#
#sketching the country map without own dataset
#one
# Map of the world
map("world") 

# Map of the particular country

map("world", "France")
map.cities(country = "France", minpop = 0,
           maxpop = Inf)

# Map of several countries

map("world", c("poland", "czech", "slovakia", "germany", "austria", "hungary"))
map.scale()
map.axes()

# Map with aditional data

library(mapdata)

map("world", "poland")
map("rivers", add=TRUE)

data(world.cities)
map("world", "Poland")
map.cities(x=world.cities, country.etc="Poland", minpop=100000, label=TRUE)






#-----------------------------------------------------#
#using different library
library(rworldmap)
#display bubbles which size is defined by the column "POP_EST" ---populaion size
#this column is inbuilt in the dataset of the library

mapBubbles(dF=getMap(), nameZSize="POP_EST",nameZColour="lightsalmon", oceanCol='lightblue', landCol='wheat', mapRegion="europe", addLegend = FALSE)

#but what if we want to display our own data but use the map from the dataset
#lets create the vector of random numbers (but it can be excel file or any source of data)

ran_numb<-(floor(runif(28, min=0, max=101)))

#now lets list EU countries into a vector, later on we will use those country names in orger to match 
#our dataset with the inbuilt map

europeanUnion <- c("Austria","Belgium","Bulgaria","Croatia","Cyprus",
                   "Czech Republic","Denmark","Estonia","Finland","France",
                   "Germany","Greece","Hungary","Ireland","Italy","Latvia",
                   "Lithuania","Luxembourg","Malta","Netherlands","Poland",
                   "Portugal","Romania","Slovakia","Slovenia","Spain",
                   "Sweden","United Kingdom")
#merge two vectors
new<-as.data.frame(t(rbind(europeanUnion,ran_numb)))
#attaching our own (random) data to the inbuilt dataset

joined_data<-joinCountryData2Map(new, joinCode="NAME", nameJoinColumn="europeanUnion")
library(forcats) 
fct_explicit_na(joined_data$ran_numb, na_level = "")
joined_data$ran_numb <- as.numeric(as.character(joined_data$ran_numb))
library(rworldmap)

#making bubble chart on map using own data

mapBubbles(joined_data, nameZSize="ran_numb", nameZColour="ran_numb", colourPalette="rainbow", oceanCol='lightblue', landCol='wheat', mapRegion='europe', addLegend = FALSE, catMethod = "pretty")

#coloring map according to the values in the particular column
colourPalette <- RColorBrewer::brewer.pal(4,'RdPu')
mapCountryData(joined_data,nameColumnToPlot = "GDP_MD_EST", colourPalette="white2Black", mapRegion='eurasia', addLegend = TRUE)
#labelCountries( mapRegion='eurasia') ---> too many lables

#creating an interactive map where will be displayed all of the columns from dataset
df <- as.data.frame(joined_data) #here you can use read.csv function for example, but your dataset should contain long&lat points
library(mapview)
coordinates(df) <- ~ LON + LAT
proj4string(df) <- "+init=epsg:4326" #special long&lat coding
mapview(df)

