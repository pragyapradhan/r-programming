#Named Vectors

Charlie <- 1:5
Charlie


#gives names

names (Charlie) <- c("a", "b", "c","d","e")
names(Charlie)
Charlie
Charlie[4]
Charlie["d"]

#clear names

names(Charlie) <- NULL
Charlie



#------------------------------

#Naming Matrix Dimensions 1

temp.vec <- rep(c("a","B","xX"), each =3)
temp.vec


Bravo <- matrix(temp.vec, nrow = 3, ncol = 3)
Bravo

rownames(Bravo) <- c("how", "are","you?")
Bravo


colnames(Bravo) <- NULL
Bravo



