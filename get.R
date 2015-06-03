
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
                     "G",
                     "G_batting",
                     "AB",
                     "R",
                     "H",
                     "2B",
                     "3B",
                     "HR",
                     "RBI",
                     "SB",
                     "CS",
                     "BB",
                     "SO",
                     "IBB",
                     "HBP",
                     "SH",
                     "SF",
                     "GIDP",
                     "G_old")
  
  return(data)
}

get_fielding <- function(){
  data <- read.table("data/Fielding.txt", sep = ",", stringsAsFactors = F)
  names(data) <- c(  "playerID",
                     "yearID",
                     "stint",
                     "teamID",
                     "lgID",
                     "POS",
                     "G",
                     "GS",
                     "InnOuts",
                     "PO",
                     "A",
                     "E",
                     "DP",
                     "PB",
                     "WP",
                     "SB",
                     "CS",
                     "pickoffs" ,
                     "ZR",
                     "missing_g_c",
                     "missing_g")
  
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
                   "franchID",
                   "divID",
                   "Rank",
                   "G" ,
                   "Ghome",
                   "W" ,
                   "L" ,
                   "DivWin",
                   "WCWin",
                   "LgWin",
                   "WSWin",
                   "R" ,
                   "AB" ,
                   "H" ,
                   "2B" ,
                   "3B" ,
                   "HR" ,
                   "BB" ,
                   "SO" ,
                   "SB" ,
                   "CS" ,
                   "HBP",
                   "SF",
                   "RA" ,
                   "ER",
                   "ERA",
                   "CG" ,
                   "SHO" ,
                   "SV" ,
                   "IPouts",
                   "HA" ,
                   "HRA" ,
                   "BBA" ,
                   "SOA" ,
                   "E",
                   "DP",
                   "FP",
                   "name",
                   "park",
                   "attendance",
                   "BPF",
                   "PPF",
                   "teamIDBR",
                   "teamIDlahman45",
                   "teamIDretro")
  
  return(data)
}