# CSC-423
Analysis and Regression Class Project

[Data Source](http://www.baseball-databank.org/)

[Presentation](https://docs.google.com/presentation/d/1lB1HRUvr4KrxHX9rTgn1gwelEslNJz-MHDa8Xg9hZhM/edit?usp=sharing)

[Executive Summary](https://docs.google.com/document/d/1c5ZU34aC47uJMyGSNUogbsrBh1j79zGvSCKIg0PuL7Q/edit?usp=sharing)

# Executive Summary

##Predicting Winners of the Silver Slugger Award

The Silver Slugger Award is awarded annually to the best offensive player (batting) for each position in both leagues (American and National) of the MLB. A single player can win the SS multiple times over a series of years. Since the SS is a batting award recognizing players of high offensive value, common batting stats such as: Hits, Home Runs, Strikeouts etc. were evaluated for their predictiveness in determining which players would win the award each year.

In order to model who would win the award, a Logistic Regression model was fitted to the data. Logistic regression is a commonly used technique that attempts to determine a mathematical equation that establishes a probability that the outcome is true given some explanatory data. In this case the outcome is “Winning the Silver Slugger Award” and the explanatory data is the player's batting stats.

After eliminating variables that did not improve the model, the following variables were found to produce a statistically significant change in the likelihood that the player would win the Silver Slugger award:

* **Hits** - Players that hit more balls had a higher likelihood of winning
* **Home Runs** - Players that had more home runs had a higher likelihood of winning
* **Stolen Bases** - Players that stole more bases had a higher likelihood of winning
* **Intentional Walks** - Players that were walked more often had a higher likelihood of winning
* **Strikeouts** - Players that had fewer strikeouts had a higher likelihood of winning

This model makes sense since better players generally hit more balls, have more home runs, steal more bases, strike out less, and are intentionally walked more often (so they don’t hit another home run).

To check the predictive usefulness of the model, several tests were performed on data that had not been used previously. These tests demonstrated that the model correctly identifies over 96% of the players award statuses. This includes identifying nearly 60% of the players that win the award. Further, the players that the model believe will win the award, win the award 50% of the time. This is an excellent result considering less than 2% of players win the award each year.

# Getting Started

1. Open project in RStudio
2. Install Libraries
3. Run main function in do.R
4. knit the .Rmd file
5. Look at pretty plots