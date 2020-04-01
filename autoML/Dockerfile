FROM rocker/rstudio

RUN sudo su \
&& cd /home/rstudio \
&& git clone https://github.com/it-iex/DataScience.git \
&& cd DataScience \ 
&& git pull \
&& apt-get update \ 
&& apt-get install libxml2-dev libgit2-dev libpng-dev libjpeg-dev -y \
&& R -e ' setwd("/home/rstudio/DataScience/autoML"); \
 install.packages(c("fpc", "git2r", "usethis", "roxygen2", "devtools", "caret", "caretEnsemble", "arm", "Hmisc", "monomvn", "gam", "randomForest", "e1071", "corrplot", "mlbench")); \
 setwd("/home/rstudio/DataScience/autoML"); \
 install.packages("/home/rstudio/DataScience/autoML/autoML_1.8.26.tar.gz", repos = NULL, type = "source"); library(autoML)'