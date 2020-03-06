\name{autoEnsemble}
\alias{autoEnsemble}
\title{
Automated ensemble model creation
}
\description{
Creates three different ensemble models based on ten different sub-models with three different parameters each. Ensemble models combine the stregnths of each sub-model to create a stronger
overall model. This grouping of models should be used for \strong{regression}. Models used in the program are:
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
\item CART}
}
\usage{
autoEnsemble(form, dat)
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
\item{stack.glm.boot }{Stacked ensemble model using bootstrap. }
\item{stack.glm.cv  }{Stcked ensemble model using cross validation. }
\item{stack.glm.rcv  }{stacked ensemble model using repeated cross validation.}
\item{boot }{All the models that used the boostrap parameter. }
\item{cv }{All the models that used cross validation.}
\item{rcv }{All the models that used repeated cross validation. }
\item{modelList }{Displays the types of different models used in the program. }
}
\author{
Brett W. - Data Science Engineer, Iron EagleX.
}
\examples{
example <- autoEnsemble(mpg~., mtcars)
example$cv$glmStepAIC
example$stack.glm.rcv$ens_model$results
}
