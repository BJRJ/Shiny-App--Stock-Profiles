Developing Data Products Course - Course Project: Shiny Application and Reproducible Pitch
========================================================


Introduction
-------------

The course project comprises of two parts: a) A shiny app which accepts an input, perform computation and displays a reactive output. b) A presentation which serves as a documentation for the shiny app.

The link for the shiny app is:
https://biju.shinyapps.io/Stock_Profiles/

The link for the ui.R and server.R files is here: 
https://github.com/BJRJ/Shiny-App--Stock-Profiles

The link for the app documentation is here:
http://rpubs.com/bijeshr/306254

About the Shiny App
-------------

The app allows you to plot the stock prices of any number of NASDAQ registerd companies over a period of 49 days. Google provides the stock price information of different companies over a period of time as described in the link below: http://www.networkerror.org/component/content/44.html?task=view

The user enters a list of stock sybmols, which is then plotted as a function of time(days). An option has been included to plot the stock prices in the log scale, in case the stock prices of different companies are very different.

The app additionally allows to check for correlation between stock prices of different companies. You can generate a feature plot, as well as plot the correlation coefficients of the stock prices of different companies. For the latter "corrplot" package has been used. These additional plots will only be displayed if more than one stock symbols have been entered.

