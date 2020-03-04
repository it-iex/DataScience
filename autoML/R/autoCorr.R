#' @export

autoCorr <- function(dat) {

  ##### Select the data and put it into a dataframe. #####
  my_data <- dat

  # Creates a correlation matrix.
  corDat <- stats::cor(my_data)

  # Says if any features are hightly correlated (>0.9).
  caret::findCorrelation(corDat)

  highlyCor <- caret::findCorrelation(corDat, cutoff = .75)
  dat2 <- my_data[,-highlyCor]
  corDat_2 <- stats::cor(dat2)

  ##### Create results list. #####
  results <- list()

  results$data <- dat2
  results$new.correlation <- corDat_2
  results$old.correlation <- corDat
  results$corr.features <- colnames(subset(my_data, select = highlyCor))
  results$new.features <- colnames(dat2)

  ##### Send output. #####

  return(results)
}
