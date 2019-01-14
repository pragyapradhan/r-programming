setwd("C:\\Users\\Pra\\Documents\\R\\4. DataFrames")
getwd()
worldtrend <- read.csv("Section5-Homework-Data.csv")


head(worldtrend)
tail(worldtrend)
str(worldtrend)
summary(worldtrend)

#splitting the dataframe into two data frame using filter

data1960 <- worldtrend[worldtrend$Year == "1960",]
data2013 <- worldtrend[worldtrend$Year == "2013",]

head(data1960)
head(data2013)

#check new counts
nrow(data1960) #187
nrow(data2013) #187

#Turning vector into df
new1960 <- data.frame(Code = Country_Code,Life.Expectancy = Life_Expectancy_At_Birth_1960)
new2013 <- data.frame(Code = Country_Code,Life.Expectancy = Life_Expectancy_At_Birth_2013)
head(new1960)
head(new2013) 

nrow(new1960)
nrow(new2013)#187

#merging the two data frame 
merged1960 <- merge(data1960, new1960, by.x = "Country.Code", by.y = "Code")
head(merged1960)
merged2013 <- merge(data2013, new2013, by.x = "Country.Code", by.y = "Code")
head(merged2013)


# visualization  for 1960

qplot(data = merged1960, x = Fertility.Rate, y = Life.Expectancy, size = I(4),
      color = Region, shape = I(19), 
      alpha = I(0.6), main = "Life Expectancy vs Fertility Rate in 1960")

# visualization  for 2013

qplot(data = merged2013, x = Fertility.Rate , y = Life.Expectancy, size = I(5),
      color = Region,pch=I(19),
      alpha = I(0.6), main = "Life Expectancy vs Fertility Rate in 2013")