getwd()
setwd("C:\\Users\\Pra\\Documents\\R\\5. GGPLOT2")
getwd()

movies <- read.csv("Movie-Ratings.csv")

#Exploring

head(movies)
colnames(movies) <- c("Film", "Genre", "CriticRating","AudienceRating","BudgetMillions", "Year")
head(movies)     
summary(movies)
str(movies)
nrow(movies)


#changing "Year"(numerical variable) to categorical variable  

factor(movies$Year)
movies$Year <- factor(movies$Year)
summary(movies)
str(movies)

# ---------------------Aesthetics


library(ggplot2)
?ggplot
ggplot(data = movies,
       aes(x= CriticRating, y = AudienceRating)) + geom_point()

#add color
ggplot(data = movies,
       aes(x= CriticRating, y = AudienceRating,
           colour = Genre, size = BudgetMillions)) + geom_point()


#>>>>> This #1 (We will improve on it)

#----------------------------------plotting with layers - Geometric
p <- ggplot(data = movies,
            aes(x= CriticRating, y = AudienceRating,
                colour = Genre, size = BudgetMillions))



p + geom_point()
p + geom_line()
p + geom_line() + geom_point()
#----------------------------------------------------------------------
a <- ggplot(data = movies,
            aes(x= CriticRating, y = AudienceRating,
                colour = AudienceRating, size = BudgetMillions))



a + geom_point() + geom_bar(size = 1)


#----------------------------------------------------------------------------

#------ Overiding Aesthetics

q <- ggplot(data = movies,
            aes(x= CriticRating, y = AudienceRating,
                colour = Genre, size = BudgetMillions))

#add geom layer
q+ geom_point()


#overriding aes
#eg 1
q + geom_point(aes(size= CriticRating))

#eg 2
q + geom_point(aes(color= BudgetMillions))

#eg 3

q + geom_point(aes(x = BudgetMillions)) +
  xlab("Budget Million $$$")

#eg4 

q+ geom_line() + geom_point()

#reduce line size

q + geom_line(size =1) + geom_point()


#----------------------Mapping vs Setting

r <- ggplot(data = movies, aes(x=CriticRating, y=AudienceRating))
r+ geom_point()


#---------Add color
 #1. Mapping:

r + geom_point(aes(color=Genre))

#2. Setting:
r + geom_point(color ="DarkGreen")

#Error type:
#r + geom_point(aes(color="DarkGreen"))

#1. Mapping 
 r + geom_point(aes(size=BudgetMillions))

#2. Setting:
 
 r + geom_point(size = 3, color = "green", alpha = 0.2)

#Error
 
 #r + geom_point(aes(size=10))

 
  #-----------------------Histogram and Density Charts
 
 s <- ggplot(data = movies, aes(x = BudgetMillions))
 s + geom_histogram(binwidth = 12) 

 
 #--------------Adding color, border
 
 s + geom_histogram(binwidth = 12, fill = "green")
 s + geom_histogram(binwidth = 12, aes(fill= Genre), color = "black", alpha=0.3)
 
 #sometimes you may need density charts:
 
 S + geom_density(aes(fill=Genre))
 s + geom_density(aes(fill=Genre), position = "stack")
 
 
 #----------Starting  Layer Tips
 
t <- ggplot(data = movies, aes(x = AudienceRating))
t + geom_histogram(biniwidth = 10, fill = "Blue", color= "Black") 

#-----------Another way:

t <- ggplot(data = movies)
t + geom_histogram(biniwidth= 10,
                   aes(x=AudienceRating),
                   fill = "White",color = "Blue")

t <- ggplot(data = movies)
t + geom_histogram(biniwidth= 10,
                   aes(x=CriticRating),
                   fill = "Blue",color = "Black")

#--------------statistical Transformations


U <- ggplot(data = movies, aes(x= CriticRating, y=AudienceRating,colour = Genre))
U + geom_point() + geom_smooth(fill = NA )


#-----------boxplot 

u <- ggplot(data = movies, aes(x= Genre, y = AudienceRating, color =Genre))
u + geom_boxplot()
u + geom_boxplot(size = 1.2)+ geom_point()

#tips/ Hacks:
u + geom_boxplot(size=1.2) + geom_jitter()

u+ geom_jitter() + geom_boxplot(size = 1.2, alpha = 0.7)



#v <- ggplot(data = movies, aes (x = Genre, y = CriticRating, color = Genre))
#v + geom_jitter()+ geom_boxplot(size = 1.3, alpha = 0.5)


# -------------------------Using Facets

v <- ggplot(data = movies, aes(x=BudgetMillions))
v + geom_histogram(binwidth = 10, aes(fill = Genre), color = "Black")


#Facets
 v + geom_histogram(binwidth = 10, aes(fill=Genre), color = "Black") +
                    facet_grid(Genre~., scales ="free")
 #v + geom_histogram(binwidth = 10, aes(fill=Genre), color = "Black") +
  # facet_grid(.~ Genre)
 
 #scatterplots:
 
 w <- ggplot(data = movies, aes(x= CriticRating, y = AudienceRating, colour=Genre))
 w + geom_point(size = 3)

 #facets
 w + geom_point(size = 3) + facet_grid(Genre~.)
 
 w + geom_point(size = 3) + facet_grid(.~Year)

 w + geom_point(size = 3) + facet_grid(Genre~Year)+ geom_smooth()

 w + geom_point(aes(size = BudgetMillions)) + facet_grid(Genre~Year)+ geom_smooth()
 #--------------- 1 ( But still will improve )
 
 #------------------------------ Coordinates
 
 #Today
 #limits
 #Zoom
 
 m <- ggplot(data = movies, aes(x=CriticRating, y= AudienceRating, 
                        size = BudgetMillions, 
                        color=Genre))
 m + geom_point()
 
 m + geom_point() +               
   xlim(50, 100) +
   ylim(50, 100)
 
#WONT WORK WELL ALAWAYS
 
 n <- ggplot(data = movies, aes(x = BudgetMillions))
 n + geom_histogram(binwidth = 10, aes(fill = Genre), color="Black") +
   ylim(0, 50)
 
#instead ZOOM
 
 n + geom_histogram(binwidth = 10, aes(fill = Genre), color="Black")+
   coord_cartesian(ylim = c(0,50))

 
 w <- ggplot(data = movies, aes(x= CriticRating, y = AudienceRating, colour=Genre))
 w + geom_point(size = 2)
 w + geom_point(aes(size = BudgetMillions)) + facet_grid(Genre~Year)+ geom_smooth() 
   coord_cartesian(ylim=c(0,100))
   
   
   
   
#------------------- Theme
o <- ggplot(data = movies, aes(x = BudgetMillions))
h <- o + geom_histogram(binwidth = 10, aes(fill= Genre), color = "black")
h

# axes label 

h + 
  xlab("Money Axis") +
  ylab("Number of Movies")+
  ggtitle("Movie Budget Distribution")+
  theme(axis.title.x = element_text(colour = "DarkGreen", size = 12),
        axis.title.y = element_text(colour = "Red", size = 12),
        axis.text.x = element_text(size = 20),
        axis.text.y = element_text(size = 20),
        
        legend.title = element_text(size = 20),
        legend.text = element_text(size = 20),
        legend.position = c(1,1),
        legend.justification = c(1,1),
        plot.title = element_text(colour="DarkBlue",
                                  size = 40,
                                  family = "Courier", position = center) )

?theme
