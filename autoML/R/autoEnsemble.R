#' @export

autoEnsemble <- function(form, dat) {

  ##### Data Exploring #####

  set.seed(1337)

  df <- as.data.frame(dat)

  ##### List of current models. #####

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

  results_boot <- list()

  results_cv <- list()

  results_rcv <- list()


  ##### Training the models. #####

  # Boot parameter.

  ctr_boot <- caret::trainControl(method = "boot",
                           savePredictions = "final")

  results_boot <-
    caretEnsemble::caretList(form,
              data = df,
              trControl = ctr_boot,
              methodList = modelList)

  # CV parameter.

  ctr_cv <- caret::trainControl(method = "cv",
                         savePredictions = "final")

  results_cv <-
    caretEnsemble::caretList(form,
              data = df,
              trControl = ctr_cv,
              methodList = modelList)



  # RepeatedCV parameter.

  ctr_rcv <- caret::trainControl(method = "repeatedcv",
                          savePredictions = "final")

  results_rcv <-
    caretEnsemble::caretList(form,
              data = df,
              trControl = ctr_rcv,
              methodList = modelList)

  ##### Create ensemble model. #####

  stackControl <- caret::trainControl(
    method = "repeatedcv",
    number = 10,
    repeats = 10,
    savePredictions = TRUE
  )

  stack.glm.boot <-
    caretEnsemble::caretStack(c(results_boot),
               method = "rf",
               metric = "Rsquared",
               trControl = stackControl)

  stack.glm.cv <-
    caretEnsemble::caretStack(c(results_cv),
               method = "rf",
               metric = "Rsquared",
               trControl = stackControl)

  stack.glm.rcv <-
    caretEnsemble::caretStack(c(results_rcv),
               method = "rf",
               metric = "Rsquared",
               trControl = stackControl)

  ##### Combine results. #####

  #TODO Determines the best ensemble model.

  results <- list()

  results$stack.glm.boot <- stack.glm.boot
  results$stack.glm.cv <- stack.glm.cv
  results$stack.glm.rcv <- stack.glm.rcv

  results$boot <- results_boot
  results$cv <- results_cv
  results$rcv <- results_rcv

  results$list.of.models <- modelList

  ##### Output return. #####
  return(results)
}
