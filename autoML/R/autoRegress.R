#' @export

autoRegress <- function(form, dat) {

  ##### Data Exploring #####

  set.seed(1337)

  df <- as.data.frame(dat)

  y <- strsplit(paste(form), "~")[[2]]

  y <- subset(df, select = y)

  y <- unlist(c, use.names = FALSE)

  ##### List of current models and parameters. #####

  paramList <-
    c(
      "boot",
      "boot632",
      "optimism_boot",
      "boot_all",
      "cv",
      "repeatedcv",
      "LOOCV",
      "LGOCV"
    )
  modelList <-
    c(
      "treebag",
      "bayesglm",
      "glm",
      "glmStepAIC",
      "lm",
      "lmStepAIC",
      "bridge",
      "rpart1SE",
      "gaussprLinear",
      "blassoAveraged"
    )

  ##### Create where the results will go. ######

  results <- list()
  results_2 <- list()

  i <- 0
  j <- 0

  ##### Training the models. #####

  for (mod in modelList) {
    for (param in paramList) {
      cv.folds <- caret::createMultiFolds(y, k=10, times = 3)
      ctr <- caret::trainControl(method = param, index = cv.folds, number=10, repeats = 10)
      results[[paste(mod, param, sep = ".")]] <-
        caret::train(
          form,
          data = df,
          method = mod,
          trControl = ctr )

      print(c(param, mod))

      results_2[[paste(mod, param, sep = ".")]] <- results[[paste(mod, param, sep = ".")]]$results$Rsquared

      j <- j + 1
    }
    i <- i + 1
  }

  ##### Combine Results. #####

  model.results <- sort(unlist(results_2), decreasing = TRUE)

  ##### Determine the model with the highest R-squared value. #####

  bestMod <- model.results[1]

  ##### Create results list. #####

  results$results <- model.results

  results$best.model <- bestMod

  ##### Output return. #####
  return(results)
}
