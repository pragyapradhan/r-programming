


Games
rownames(Games)
colnames(Games)
Games["LeBronJames", "2012"]

FieldGoals


round(FieldGoals/ Games,1)



# Minutes Played per games

round(MinutesPlayed/Games)

#field goals attempt per games
round(FieldGoalAttempts/Games)

#field goals per field goals attempts - accuracy of each player 
round(FieldGoals/FieldGoalAttempts,1)

