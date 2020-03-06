\name{autoSVM}
\alias{autoSVM}
\title{
Automated support vector machine (SVM) creation
}
\description{
Performs a grid search on an SVM with three different resampling methods and four different kernals. The grid search discovers the optimal values for alpha, gamma, and cost. The model is run many, many times so it \strong{may run for a long time}. Even a medium sized dataset with many features \strong{could take hours} before it is finished.
}
\usage{
autoSVM(form, dat)
}
\arguments{
  \item{form}{
Formula. The relationship between variables to be explored.
}
  \item{dat}{
Data. The data source.
}
}
\value{
\item{best.model}{The tuned SVM model. }
\item{pred}{The predictions the model made on the test set. }
\item{tuning }{The parameters that were changed for the SVM. }
\item{training }{The training set of data.}
\item{testing }{The testing set of data. }
}
\author{
Brett W. - Data Science Engineer, Iron EagleX.
}
\examples{
example <- autoSVM(Species ~ Sepal.Length + Sepal.Width, iris)
example$best.model

example <- autoSVM(Species ~ Petal.Length + Petal.Width, iris)
caret::confusionMatrix(example$pred, example$testing$Species)
}
