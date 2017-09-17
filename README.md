Developing Data Products Course - Course Project: Shiny Application and Reproducible Pitch
========================================================


Introduction
-------------

The course project comprises of two parts: a) A shiny app which accepts an input, perform computation and displays a reactive output. b) A presentation which serves as a documentation for the shiny app.

The link for the shiny app is:
https://biju.shinyapps.io/stock_profiles2/

The link for the ui.R and server.R files is here: 
https://github.com/BJRJ/Shiny-App--Stock-Profiles

The link for the app documentation is here:
http://rpubs.com/bijeshr/308762

About the Shiny App
-------------

The app allows you to plot the stock prices of any number of NASDAQ registerd companies over a period of 49 days. The stock price data for this app is pulled from this link: http://www.networkerror.org/component/content/44.html?task=view

The user may enter a list of stock sybmols (case insensitive), which is then plotted as a function of time(days).For example, enter the stock symbols of Google (GOOGL) and Amazon (AMZN) to see the stock prices over the last few days. An option has been included to plot the y-axis of the stock prices data in the log scale, in case the stock prices of different companies are very different.

The app additionally allows to check for correlation between stock prices of different companies. For this purpose, 2 additional plots can be generated: 1) You can create a paired X-Y plot between all the stock symbols you entered.This will allow you to visually see if the stock prices of different compaones are correlated to each other 2) You can plot the correlation values between any 2 pairs, this is done using "corrplot" package has been used. For example, a value of 0 indicated no correlation, and a value of 1 indicates perfect correlation.

You don't need to be an expert in stocks to use this app. However, if you don't know what stock symbols to enter, please go the following site: http://www.nasdaq.com/screening/companies-by-industry.aspx?exchange=NASDAQ

Don't forget to hit the GO! button to see the results.


