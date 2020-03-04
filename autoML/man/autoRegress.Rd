\name{autoRegress}
\alias{autoRegress}
\title{
Automated regression
}
\description{
Performs ten different types of regression with eight different parameters and principal component analysis to create eighty models. The different models are:
\enumerate{
\item Bagged CART
\item Baysein GLM
\item Generalized Linear Model
\item Generalized Linear Model with Stepwise Feature Selection
\item Linear Model
\item Linear Regression with Stepwise Selection
\item Bayesian Ridge Regression
\item Bayesian Ridge Regression (Model Averaged)
\item Gaussian Process
\item CART} Each of the models above are accessed with the resampling method after the name. To save space, I did not list all eighty models here. The options after it are:
\enumerate{
\item boot
\item boot632
\item opBoot
\item bootAll
\item cv
\item repeatCV
\item loocv
\item lgocv}
Models are returned for further use, along with the results of all the models and the best performing model.}
\usage{
autoRegress(form, dat)
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
\item{best.model}{Returns the results of the best performing model.}
\item{results}{Shows how every model performed.}
\item{treebag}{Bagged CART model. }
\item{bayesglm}{Baysein GLM.}
\item{glm}{Generalized Linear Model.}
\item{glmStepAIC}{Generalized Linear Model with Stepwise Feature Selection}
\item{lm}{Linear Model. }
\item{lmStepAIC}{Linear Regression with Stepwise Selection. }
\item{bridge}{Bayesian Ridge Regression.}
\item{blassoAveraged}{Bayesian Ridge Selection Regression (Model Averaged).}
\item{gaussprLinear}{Gaussian Process.}
\item{rpart1SE}{CART.}
}
\author{
Brett W. - Data Science Engineer, Iron EagleX.
}
\examples{
example <- autoRegress(mpg ~., mtcars)
example$best.model

example <- autoRegress(Sepal.Width ~., subset(iris, select = -c(Species)))
subset(example$results, example$results > 0.6)
}
