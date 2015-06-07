library(dplyr)

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

fix_factors <- function(data){
  data <- data %>%
            mutate(teamID = as.factor(teamID),
                   lgID = as.factor(lgID),
                   f_POS = as.factor(f_POS),
                   t_franchID = as.factor(t_franchID),
                   t_divID = as.factor(t_divID),
                   t_DivWin = as.factor(t_DivWin),
                   t_WCWin = as.factor(t_WCWin),
                   t_LgWin = as.factor(t_LgWin),
                   t_WSWin = as.factor(t_WSWin),
                   t_name = as.factor(t_name),
                   t_park = as.factor(t_park),
                   t_teamIDBR = as.factor(t_teamIDBR),
                   t_teamIDlahman45 = as.factor(t_teamIDlahman45),
                   t_teamIDretro = as.factor(t_teamIDretro),
                   awardID = as.factor(awardID))
  
  return(data)
}

add_award_cols <- function(data){
  data <- data %>%
            mutate(win_silver_slug = ifelse(is.na(awardID), F, awardID == "Silver Slugger"))
  
  return(data)
}