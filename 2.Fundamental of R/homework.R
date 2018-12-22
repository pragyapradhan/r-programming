# Homework assignment : Law of Large Numbers 
# by pra

N <- 1000
count =0
for (i in rnorm (N)){
  if( i <=1 & i >= -1){
    count =count +1
  }
}
cal_mean=count/N
cal_mean






#------------------------------------------------------------------


N <- 1000 #specify sample size
counter <- 0   #reset counter
for( i in rnorm(N)){            #iterate over vector of numbers
  if( i >= -1 & N <= 1){          #check where iterated variable falls
    counter <- counter +1       #increase counter if condition is met
  }
}
counter / N  #calculate hit-ratio          
counter #print answer in console






N <- 100000
counter <-0
for (a in rnorm(N)) {
  if (a > -1 & a < 1 ) {
    counter <- counter+ 1
    
  }
}
 result <- counter/N  # compare to 86.2% or 0.683
 Percentage <- result * 100


