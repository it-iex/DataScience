#' @export

autoFeat <- function(form, dat) {

  ##### Set seed value. #####

  set.seed(1337)

  ##### Create results list. #####

  results <- list()

  ##### Method 1. Random Forest. #####

  ranFor <- randomForest::randomForest(form, data = dat, importance = TRUE)

  # Assign output to results.
  results$model.randomforrest <- ranFor
  results$model.randomforrest.results <- ranFor$importance

  ##### Method 2. Recursive Feature Elimination. #####

  # Parameters for method two.
  param_m2 = c("boot", "cv", "loocv")
  i <- 0

  # Train the RFE models.
  for (param in param_m2) {
    control <- caret::rfeControl(functions = caret::rfFuncs,
                          method = param,
                          number = 10)

    results[[paste("model.rfe", param, sep = ".")]] <-
      caret::rfe(form, dat, rfeControl = control)

    i <- i + 1
  }

  ##### Method 3. Univariate filter (Random Forest). #####

  # Parameters for method three.
  param_m3 = c("boot", "cv", "loocv", "lgocv")
  j <- 0

  # Train the SBF models.
  for (param in param_m3) {
    control <- caret::sbfControl(functions = caret::rfSBF,
                          method = param,
                          repeats = 10)

    results[[paste("model.filter", param, sep = ".")]] <-
      caret::sbf(form, dat, sbfControl = control)

    j <- j + 1
  }

  ##### Send output. #####

  return(results)
}
