#Data
revenue <- c(14574.49, 7606.46, 8611.41, 9175.41, 8058.65, 8105.44, 11496.28, 9766.09, 10305.32, 14379.96, 10713.97, 15433.50)

expenses <- c(12051.82, 5695.07, 12319.20, 12089.72, 8658.57, 840.20, 3285.73, 5821.12, 6976.93, 16618.61, 10054.37, 3803.96)

#Solution
#Profit for each month

profit<- revenue- expenses
profit

#profit after tax for each month(tax rate is 30%)

Tax <- 30/100
PAT<- round(profit -Tax*profit, 2)
PAT


#Profit margin for each month - equals to profit after tax divided by revenue

PM <- round(PAT/revenue, 2) *100
PM


#Good Months- where the profit after tax was greater than the mean for the year

GM <- PAT > mean(PAT)
GM


#Bad Months - where the profit after the tax was less than the mean for the year.

BM <-PAT <mean(PAT)
BM

# Best Month - where the profit after the tax was max for the year.
bestmonth <- PAT == max(PAT)
bestmonth

#Worst month - where the profit after tax was min for the year.

worstmonth <- PAT == min(PAT)
worstmonth


#Convert All the calculation to units of one thousand dollars

revenue.1000 <- round(revenue/1000, 0)
expenses.1000 <- round(expenses/1000, 0)
profit.1000 <- round(profit/1000, 0)
PAT.1000 <- round(PAT/1000, 0)



#print Results

revenue.1000
expenses.1000
profit.1000
PAT.1000
PM
GM
BM
bestmonth
worstmonth


#matrices

m <- rbind(revenue.1000,
           expenses.1000,
           profit.1000,
           PAT.1000,
           PM,
           GM,
           BM,
           bestmonth,
           worstmonth)
m
