#Method 1

#stats <-read.csv(file.choose())
#stats


#Method 2: Set Working directory and read data

getwd()


setwd("C:\\Users\\Pra\\Documents\\R\\4. DataFrames")
getwd()
rm(stats)
stats <- read.csv("DemographicData.csv")
stats





#---------------------------------- exploring data
stats
nrow(stats)
ncol(stats)
#Imported 195 rows and 5 cols 

head(stats, n= 10)
tail(stats)

str(stats)
#str() structure
#runif() random variable distributed uniformlly

summary(stats)

#---------------------------------------Using the $ sign

stats
head(stats, n= 3)
stats[3, 3]
stats[3, "Birth.rate"]
stats[3, "Income.Group"]

stats$Internet.users[2]
stats$Income.Group[6]
stats$Country.Code[2]


levels(stats$Income.Group)


#---------------------------------Basic Operations with DF

stats[1:10,]#subsetting

head(stats, n=10)


stats[3:9,]
stats[c(4, 100),]


#Remember how the [] work :
stats[1, ]
is.data.frame(stats[1, ]) #no need for drop= F
stats[,1, drop= F]
is.data.frame(stats[,1, drop=F])

#multiply columns

head(stats)
stats$Birth.rate * stats$Internet.users
stats$Birth.rate + stats$Internet.users

#add column

head(stats)
stats$MyCalc <- stats$Birth.rate * stats$Internet.users

#test of knowledge

stats$xyz <- 1:5
head(stats, n=12)

#remove a column
stats$MyCalc <- NULL
stats$xyz <- NULL
stats$Country.Name
head(stats$Country.Name)


#---------------------------------------------- Filtering Data Frames
head(stats)
filter <- stats$Internet.users < 2
#stats[1:10, ]

stats[filter,]

stats[stats$Birth.rate > 40 & stats$Internet.users <2,]
stats[stats$Income.Group =="High income",]

stats[stats$Country.Name == "Malta",]

#--------------------------------------------- Intro to qplot

tail(stats)
?qplot
library(ggplot2)
qplot(data=stats, x=Internet.users )

qplot(data=stats, x=Income.Group, y=Birth.rate) 

qplot(data=stats, x=Income.Group, y=Birth.rate, size = I(3) )
qplot(data=stats, x=Income.Group, y=Birth.rate, size = I(3), colour =I("Blue"))

qplot(data=stats, x=Income.Group, y=Birth.rate, geom = "boxplot")


#-------------------------------------- Visualization with qplot 

qplot(data = stats, x=Internet.users, y = Birth.rate)
qplot(data = stats, x=Internet.users, y = Birth.rate, size = I(4), colour = I("RED"))
qplot(data = stats, x=Internet.users, y = Birth.rate, size = I(4), colour = Income.Group, size =I(5))


#--------------------------------------- Creating data frame 

mydf <- data.frame(Countries_2012_Dataset,
                   Codes_2012_Dataset,
                   Regions_2012_Dataset )

head(mydf)
#colnames(mydf) <- c("Country", "Code", "Region")
# below  approach can right away rename colnames
mydf <- data.frame(Country = Countries_2012_Dataset,
                   Code = Codes_2012_Dataset,
                   Region = Regions_2012_Dataset )

tail(mydf)
summary(mydf)

#-------------------------------------- Merging

# data mapping  - merging the dataframe

#stats + mydf

head(stats)
head(mydf)

?merge
merged <- merge(stats, mydf,by.x ="Country.Code", by.y = "Code") #matching the two column

head(merged, n= 15)

merged$Country<- NULL # removing the duplicate column
str(merged)

tail(merged)


#-----------------------------visualizing with new split

qplot(data = merged, x=Internet.users, y = Birth.rate, size = I(4), colour = Region, size =I(2))

#1. Shapes

qplot(data = merged, x=Internet.users, y = Birth.rate, size = I(4), colour = Region, size =I(4), shape = I(25))


#2. Transparancy

qplot(data = merged, x=Internet.users, y = Birth.rate, size = I(4), 
      colour = Region, size =I(4), shape = I(19), alpha = I(0.8),
      main = "Birth Rate vs Internet Users")



