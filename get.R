get_awards_players <- function(){
  data <- read.table("data/AwardsPlayers.txt", sep = ",", stringsAsFactors = F)
  names(data) <- c("playerID",
  "awardID",
  "yearID",
  "lgID",
  "tie",
  "notes")
  
  return(data)
}

get_batting <- function(){
  data <- read.table("data/Batting.txt", sep = ",", stringsAsFactors = F)
  names(data) <- c(  "playerID",
                     "yearID",
                     "stint",
                     "teamID",
                     "lgID",
                     "b_G",
                     "b_G_batting",
                     "b_AB",
                     "b_R",
                     "b_H",
                     "b_2B",
                     "b_3B",
                     "b_HR",
                     "b_RBI",
                     "b_SB",
                     "b_CS",
                     "b_BB",
                     "b_SO",
                     "b_IBB",
                     "b_HBP",
                     "b_SH",
                     "b_SF",
                     "b_GIDP",
                     "b_G_old")
  
  return(data)
}

get_fielding <- function(){
  data <- read.table("data/Fielding.txt", sep = ",", stringsAsFactors = F)
  names(data) <- c(  "playerID",
                     "yearID",
                     "stint",
                     "teamID",
                     "lgID",
                     "f_POS",
                     "f_G",
                     "f_GS",
                     "f_InnOuts",
                     "f_PO",
                     "f_A",
                     "f_E",
                     "f_DP",
                     "f_PB",
                     "f_WP",
                     "f_SB",
                     "f_CS",
                     "f_pickoffs" ,
                     "f_ZR",
                     "f_missing_g_c",
                     "f_missing_g")
  
  return(data)
}

get_salaries <- function(){
  data <- read.table("data/Salaries.txt", sep = ",", stringsAsFactors = F)
  names(data) <- c("yearID",
                   "teamID",
                   "lgID",
                   "playerID",
                   "salary")
  
  return(data)
}

get_teams <- function(){
  data <- read.table("data/Teams.txt", sep = ",", stringsAsFactors = F)
  names(data) <- c("yearID",
                   "lgID",
                   "teamID",
                   "t_franchID",
                   "t_divID",
                   "t_Rank",
                   "t_G" ,
                   "t_Ghome",
                   "t_W" ,
                   "t_L" ,
                   "t_DivWin",
                   "t_WCWin",
                   "t_LgWin",
                   "t_WSWin",
                   "t_R" ,
                   "t_AB" ,
                   "t_H" ,
                   "t_2B" ,
                   "t_3B" ,
                   "t_HR" ,
                   "t_BB" ,
                   "t_SO" ,
                   "t_SB" ,
                   "t_CS" ,
                   "t_HBP",
                   "t_SF",
                   "t_RA" ,
                   "t_ER",
                   "t_ERA",
                   "t_CG" ,
                   "t_SHO" ,
                   "t_SV" ,
                   "t_IPouts",
                   "t_HA" ,
                   "t_HRA" ,
                   "t_BBA" ,
                   "t_SOA" ,
                   "t_E",
                   "t_DP",
                   "t_FP",
                   "t_name",
                   "t_park",
                   "t_attendance",
                   "t_BPF",
                   "t_PPF",
                   "t_teamIDBR",
                   "t_teamIDlahman45",
                   "t_teamIDretro")
  
  return(data)
}

