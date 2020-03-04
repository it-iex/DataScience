\name{autoFeat}
\alias{autoFeat}
\title{
Automated feature analysis
}
\description{
Performs three different types of feature analysis with multiple different parameters to create eight models. The first type is random forrest, the second type is recursive feature elimination, and the third type is a univariate filter. Each type is implemented differently and using different parameters. Several models are returned for further use.
}
\usage{
autoFeat(form, dat)
}
\arguments{
  \item{form}{
The relationship between variables to be explored.
}
  \item{dat}{
The data source.
}
}
\value{
\item{model.randomforrest }{Method One, Random Forrest model.}
\item{randomforrest.results }{Method One, results.}
\item{model.rfe.boot }{Method Two, Recursive Feature Elimination. Resampling method is bootstrapped (ten reps). }
\item{model.rfe.cv }{Method Two, Recursive Feature Elimination. Resampling method is cross-validation (ten fold). }
\item{model.rfe.loocv }{Method Two, Recursive Feature Elimination. Resampling method is leave-one-out cross-validation. }
\item{model.filter.boot }{Method Three, Univariate Filter. Resampling method is boostrapped (twenty-five reps). }
\item{model.filter.cv }{Method Three, Univariate Filter. Resampling method is cross-validation (ten fold).}
\item{model.filter.loocv }{Method Three, Univariate Filter. Resampling method is leave-one-out cross-validation.}
\item{model.filter.lgocv }{Method Three, Univariate Filter. Resampling method is repeated train/test splits estimated (twenty-five reps).}
}
\author{
Brett W. - Data Science Engineer, Iron EagleX.
}
\examples{
example <- autoFeat(Species ~ Sepal.Length + Sepal.Width, iris)
example$model.randomforrest.results

example <- autoFeat(mpg ~ ., mtcars)
example$model.rfe.cv$results
}
