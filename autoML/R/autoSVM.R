#' @export

autoSVM <- function(form, dat) {

  ##### Prepare the dataset. #####

  # Set seed for reproducible results.
  set.seed(1337)

  # Put the data into a dataframe.
  df <- as.data.frame(dat)

  # Shuffle the dataframe.
  df2 <- df[sample(nrow(df)),]

  ##### Create testing and training sets of data. #####

  # 80/20 split is used for training to testing.
  size <- round(0.8 * dim(df2)[1])

  # Create the training set.
  training <- df2[1:size,]

  # Creating the testing set.
  testing <- df2[-(1:size),]

  ##### Grid search for best model parameters. #####
  tuneResult <- e1071::tune(
    e1071::svm,
    form,
    data = training,
    kernal = c("linear", "radial", "polynomial", "sigmoid"),
    ranges = list(
      gamma = seq(0, 1, 0.05),
      epsilon = seq(0, 1, 0.05),
      cost = seq(0.01, 3, .1)
    ),

    tunecontrol = e1071::tune.control(
      random = FALSE,
      nrepeat = 1,
      repeat.aggregate = mean,
      sampling = c("cross", "fix", "bootstrap"),
      sampling.aggregate = mean,
      sampling.dispersion = sd,
      cross = 10,
      fix = 4 / 5,
      nboot = 10,
      boot.size = 9 / 10,
      best.model = TRUE,
      performances = TRUE,
      error.fun = NULL
    )
  )

  ###### Results of training set. ######
  svmModPredTuned <- stats::predict(tuneResult$best.model, testing)

  ##### Create results list. #####
  results <- list()

  results$training <- training
  results$testing <- testing
  results$tuning <- tuneResult
  results$pred <- svmModPredTuned
  results$best.model <- tuneResult$best.model

  ##### Send output. #####

  return(results)
}
