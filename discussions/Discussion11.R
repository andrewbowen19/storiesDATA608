# Discussion 11
library(zoo)
library(tidyverse)
data("nottem")

# Raw plot of data - no smoothing
plot(nottem, xlab="Month", ylab="Avg Temperature", main="Average Monthly Temperatures", sub="No smoothing; Nottingham, 1920 -1939")


# Plot of nottingham data with basic SMA smoothing
# https://boostedml.com/2020/05/an-introduction-to-time-series-smoothing-in-r.html#Simple_Moving_Average
plot(nottem, main='Simple Moving Average (SMA)', ylab='Avg Temp')
lines(rollmean(nottem,5),col='blue')
lines(rollmean(nottem,40),col='red')
legend(1920, 70, col=c('black','blue', 'red'),legend=c('Raw', 'SMA 5', 'SMA 40'),lty=1,cex=0.8)
