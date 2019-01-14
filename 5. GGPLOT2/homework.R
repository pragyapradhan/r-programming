# gross % US  vs  ---- Budget and studio

getwd()
setwd("C:\\Users\\Pra\\Documents\\R\\5. GGPLOT2")
mov <- read.csv("Section6-Homework-Data.csv")

 #----exploring
head(mov)
str(mov)
summary(mov)

# Renaming colnames "Gross...US to Gross$US"


#colnames(mov)[18]<-c("Gross%US")
#head(mov)

# Filter 5 Required Genre and 6 required Studio
rg <- (mov$Genre == "action") |(mov$Genre == "adventure") |(mov$Genre == "animation") |(mov$Genre == "comedy") |mov$Genre == ("drama")
rg

rs <- mov$Studio =="Buena Vista Studios" | mov$Studio =="Fox" |mov$Studio =="Paramount Pictures" |mov$Studio =="Sony" |mov$Studio =="Universal" |mov$Studio =="WB"
rs


rs <- mov$Studio %in%  c("Buena Vista Studios", "Fox", "Paramount Pictures","Sony", "Universal","WB")
rs
mov2 <- mov[rg & rs,]
head(mov2)

#Exploring

summary(mov2)
str(mov2)
nrow(mov2)

#Visualisation

library(ggplot2)



#Error
 #p <- ggplot(data = mov2, 
 #      aes(x= Genre, y = Gross...US,
 #         colour= Studio, size = Budget...mill.)) 
 
 p <- ggplot(data = mov2, 
             aes(x= Genre, y = Gross...US)) 
 

 
 # Placing boxplot on top
 p + geom_jitter() + geom_boxplot()
 
 # adding transparancy
 p + geom_jitter() + geom_boxplot(alpha = 0.7)
 
 
 # adding colour 
 p + 
   geom_jitter(aes(size = Budget...mill., color = Studio)) +
   geom_boxplot(alpha = 0.7, outlier.colour = NA)
 
 
#SAVING
 
 q <- p + 
   geom_jitter(aes(size = Budget...mill., color = Studio)) +
   geom_boxplot(alpha = 0.7, outlier.colour = NA)
 
 
  q<- q + xlab("Genre") +
      ylab("Gross % US") +
      ggtitle("Domestic Gross % by Genre")
    
  library(extrafont)
  font_import()
  
  loadfonts(device = "win")
  windowsFonts()  
  
  q <- q +
    theme(
        axis.title.x = element_text(colour = "Blue", size = 20, family = "Comic Sans MS"),
        axis.title.y = element_text(colour = "Blue", size = 20, family = "Comic Sans MS"),
        
        
        axis.text.x = element_text(size = 11, family = "Comic Sans MS"),
        axis.text.y = element_text(size = 11, family = "Comic Sans MS"),
        
        plot.title = element_text(size = 30, family = "Comic Sans MS"),
        
        legend.title = element_text(size = 12),
        legend.text = element_text(size = 12)
        
        #text = element_text(family = "Comic Sans MS")
        )
   
  
q
           
  
  q$labels$size <- "Budget Millions"
      
warnings()
windowsFonts()  
