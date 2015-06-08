library(ggplot2)
library(cvTools)

data_summary <- function(data){
  player_count <- data %>%
                    group_by(playerID) %>%
                    summarize() %>%
                    nrow()
  
  man_years <- data %>%
                  group_by(playerID, yearID) %>%
                  summarize() %>%
                  nrow()
  
  award_count <- data %>%
                  group_by(playerID, yearID, awardID) %>%
                  summarize() %>%
                  filter(!is.na(awardID)) %>%
                  nrow()
  
  award_winners <- data %>%
                    group_by(awardID) %>%
                    summarize(players = n_distinct(playerID))
  
  players_by_pos <- data %>%
                      group_by(f_POS) %>%
                      summarize(players = n_distinct(playerID))
  
  by_year <- data %>%
                group_by(yearID) %>%
                summarize(players = n_distinct(playerID),
                          teams = n_distinct(teamID))
  
  save(data,
       player_count,
       man_years,
       award_count,
       award_winners,
       players_by_pos,
       by_year,
       file = "data_summary.Rdata")
}

plot_all_box <- function(split_col, data){
  par(mfrow=c(2,2))
  for(col in 1:ncol(data)){
    if(col != split_col){
      temp <- select(data, split_col, col)
      title <- paste(colnames(temp), collapse = " vs ")
      xlab <- colnames(temp)[1]
      ylab <- colnames(temp)[2]
      colnames(temp) <- c("x", "y")
      boxplot(y ~ x, data = temp,
              main = title,
              xlab = xlab,
              ylab = ylab)
    }
  }
  par(mfrow=c(2,2))
}

find_cut_off_logistic <- function(model, cut_offs, test_data, observed_col){
  results_at_cut_off <- lapply(cut_offs, function(cut_off){
    predicted <- predict(model, newdata = test_data, type = "response")
    
    results <- data.frame(
      true_positive = sum((predicted >= cut_off) & test_data[,observed_col]),
      true_negative = sum(!(predicted >= cut_off) & !test_data[,observed_col]),
      false_positive = sum((predicted >= cut_off) & !test_data[,observed_col]),
      false_negative = sum(!(predicted >= cut_off) & test_data[,observed_col]))
    return(results)
  })
  
  results_at_cut_off <- do.call("rbind", results_at_cut_off)
  results_at_cut_off <- cbind(cut_offs, results_at_cut_off)
  results_at_cut_off <- results_at_cut_off %>%
    mutate(recall = true_positive / (true_positive + false_negative),
           accuracy = (true_positive + true_negative) / (true_positive + true_negative + false_positive + false_negative),
           precision = true_positive / (true_positive + false_positive),
           specificity = true_negative / (true_negative + false_positive),
           f_measure = (2 * precision * recall) / (recall + precision),
           prior = (true_positive + false_negative) / (true_positive + true_negative + false_positive + false_negative),
           lift = precision / prior)
  
  return(results_at_cut_off)
}


model_silver_slug <- function(data){
  batting_cols <- which(grepl("b_", colnames(data)))
  batting_data <- data %>%
    group_by(playerID, yearID) %>%
    mutate(row_num = row_number(-win_silver_slug)) %>%
    filter(row_num == 1) %>%
    ungroup() %>%
    select(salary, batting_cols, win_silver_slug, playerID, yearID) %>%
    filter(complete.cases(.))

  model <- glm(win_silver_slug ~ .-playerID -yearID, data = batting_data, family = binomial())
  model_backwards_selection <- step(model, direction = "backward", trace = F)
  model_backwards_linear <- lm(win_silver_slug ~ b_G + b_G_batting + b_R + b_H + b_HR + b_RBI + b_CS + b_BB + b_SO + b_HBP + b_home_runs_per_H + b_balls_per_AB + b_HBP_per_AB + b_games_batted_per_all_games, data = batting_data)
  model_backwards_semifinal <- glm(win_silver_slug ~b_H + b_HR + b_CS + b_BB + b_SO + b_HBP + b_home_runs_per_H + b_balls_per_AB + b_HBP_per_AB + b_games_batted_per_all_games, data = batting_data,  family = binomial())
  model_backwards_final <- glm(win_silver_slug ~b_H + b_HR + b_BB + b_SO + b_home_runs_per_H + b_balls_per_AB, data = batting_data,  family = binomial())
  model_backwards_final_lm <- lm(win_silver_slug ~b_H + b_HR + b_BB + b_SO + b_home_runs_per_H + b_balls_per_AB, data = batting_data,  family = binomial())
  
  k <- 5
  r <- 5
  folds <- cvFolds(nrow(batting_data), K = k, R = r)
  cross_validated_results <- lapply(1:r, function(R){
    lapply(1:k, function(K){
      print(paste("R=", R, " K=", K, sep = ""))
      train <- batting_data[folds$subsets[folds$which != K, R],]
      test <- batting_data[folds$subsets[folds$which == K, R],]
      model <- glm(win_silver_slug ~b_H + b_HR + b_BB + b_SO + b_home_runs_per_H + b_balls_per_AB, data = train,  family = binomial())
      
      cut_offs <- seq(0, 1, by = 0.01)
      results_at_cut_off <- find_cut_off_logistic(model, cut_offs, train, which(colnames(train) == "win_silver_slug")[1])
      
      best_cut_off <- results_at_cut_off %>%
        filter(f_measure == max(f_measure, na.rm = T)) %>%
        filter(precision == max(precision, na.rm = T))
      
      cut_off <- best_cut_off$cut_off
      
      predicted <- predict(model, newdata = test, type = "response")
      
      results <- data.frame(
        true_positive = sum((predicted >= cut_off) & test$win_silver_slug),
        true_negative = sum(!(predicted >= cut_off) & !test$win_silver_slug),
        false_positive = sum((predicted >= cut_off) & !test$win_silver_slug),
        false_negative = sum(!(predicted >= cut_off) & test$win_silver_slug))
      
      return(results)
    }) %>% do.call("rbind", .)
  }) %>% do.call("rbind", .) %>%
    mutate(recall = true_positive / (true_positive + false_negative),
           accuracy = (true_positive + true_negative) / (true_positive + true_negative + false_positive + false_negative),
           precision = true_positive / (true_positive + false_positive),
           specificity = true_negative / (true_negative + false_positive),
           f_measure = (2 * precision * recall) / (recall + precision),
           prior = (true_positive + false_negative) / (true_positive + true_negative + false_positive + false_negative),
           lift = precision / prior)
  
  cut_offs <- seq(0, 1, by = 0.01)
  results_at_cut_off <- find_cut_off_logistic(model_backwards_semifinal, cut_offs, batting_data, which(colnames(batting_data) == "win_silver_slug")[1])
  
  best_cut_off <- results_at_cut_off %>%
    filter(f_measure == max(f_measure, na.rm = T)) %>%
    filter(precision == max(precision, na.rm = T))
  
  plot_of_cut_offs <- ggplot(results_at_cut_off, aes(x = cut_offs)) +
                        geom_line(aes(y = recall, colour = "Recall")) +
                        geom_line(aes(y = accuracy, colour = "Accuracy")) +
                        geom_line(aes(y = precision, colour = "Precision")) +
                        geom_line(aes(y = specificity, colour = "Specificity")) +
                        geom_line(aes(y = f_measure, colour = "FMeasure")) +
                        scale_colour_manual("",values=c("Red","Green","Blue", "Orange", "Black")) +
                        ylab(" ") +
                        geom_vline(xintercept = best_cut_off$cut_offs[1]) +
                        ggtitle("Metrics")
  
  save(batting_data,
       model_backwards_selection,
       model_backwards_linear,
       model_backwards_final,
       model_backwards_semifinal,
       model_backwards_final_lm,
       cross_validated_results,
       best_cut_off,
       plot_of_cut_offs,
       file = "silver_slug_model.Rdata")

}