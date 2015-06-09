library(dplyr)
source("get.R")
source("munge.R")
source("analyse.R")

main <- function(){
  awards <- get_awards_players()
  batting <- get_batting()
  fielding <- get_fielding()
  salaries <- get_salaries()
  teams <- get_teams()
  
  data <- join_data(batting, fielding, salaries, teams, awards) %>%
            fix_factors() %>%        
            add_award_cols() %>%
            add_batting_ratios() %>%
            filter(yearID >= 1985)
            
  
  data_summary(data)
  
  model_silver_slug(data)
}
