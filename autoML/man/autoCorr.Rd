\name{autoCorr}
\alias{autoCorr}
\title{
Automated correlation analysis
}
\description{
Discovers which variables are highly correlated. Correlated features add noise to machine learning, and removing the variables lowers the number of dimensions.
}
\usage{
autoCorr(dat)
}
\arguments{
  \item{dat}{
The data source.
}
}
\value{
\item{data }{The dataset without the correlated features present. }
\item{new.correlation }{The correlation matrix for the new set of data. }
\item{old.correlation }{The correlation matrix for the original set of data. }
\item{corr.features }{A small list of which features were correlated in the original data. }
\item{new.features }{A small list of the remaining features in the data.}}
\author{
Brett W. - Data Science Engineer, Iron EagleX.
}
\examples{
example <- autoCorr(mtcars)
example$data


corrplot::corrplot(example$old.correlation, type = "upper", order = "hclust",
         tl.col = "black", tl.srt = 45)
corrplot::corrplot(example$new.correlation, type = "upper", order = "hclust",
         tl.col = "black", tl.srt = 45)
}
