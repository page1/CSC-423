library(dplyr)
source("get.R")
source("munge.R")

main <- function(){
  awards <- get_awards_players()
  batting <- get_batting()
  fielding <- get_fielding()
  salaries <- get_salaries()
  teams <- get_teams()
  
  data <- join_data(batting, fielding, salaries, teams, awards)
  
  filter(batting, playerID == "aardsda01")
  filter(data, playerID == "aardsda01")
  
  hist(data$stint.x)
  
}