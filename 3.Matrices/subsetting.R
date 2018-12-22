


X <- c("a","b","c","d","e")
X
X[c(1,5)]

Games
Games[1:3,6:10]

Games[c(1,10),]
Games[,c("2008","2009")]
Games[1,]


is.matrix(Games[1])
is.vector(Games[1])

is.matrix(Games[1,5])
is.vector(Games[1,5])

Games[1,,drop=F]
Games[1,5, drop=F]


is.matrix(Games[1,,drop=F])
