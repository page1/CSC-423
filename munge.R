
join_data <- function(batting, fielding, salaries, teams, awards){
  data <- batting %>%
    full_join(fielding, by = c("playerID" = "playerID", 
                               "yearID" = "yearID",
                               "stint" = "stint",
                               "teamID" = "teamID", 
                               "lgID" = "lgID")) %>%
    inner_join(salaries, by = c("playerID" = "playerID", 
                                "yearID" = "yearID", 
                                "teamID" = "teamID", 
                                "lgID" = "lgID")) %>%
    inner_join(teams, by = c("yearID" = "yearID", 
                             "teamID" = "teamID", 
                             "lgID" = "lgID")) %>%
    left_join(awards, by = c("playerID" = "playerID", 
                             "yearID" = "yearID", 
                             "lgID" = "lgID"))
  
  return(data)
}