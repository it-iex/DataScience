# autoML
> Author Note: Brett W., Data Science Engineer - Iron EagleX


## Introduction
This is a machine learning package in R that attempts to augment a data sciencist's toolkit. The package automates several models with multiple different parameters to expedite the model creation.

## Description
> [DESCRIPTION file](DESCRIPTION)

Functions from the package implement the models using many different parameters and methods. Running all these parameters and methods simultanesouly saves a significant amount of time since the highest performing models can be discovered quicker.

## Programs
### autoCorr
> [Code is here.](/autoML/R/autoCorr.R) [Documentation is here.](/autoML/man/autoCorr.Rd)

Discovers which variables are highly correlated. Correlated features add noise to machine learning, and removing the variables lowers the number of dimensions.

### autoEnsemble
> [Code is here.](/autoML/R/autoEnsemble.R) [Documentation is here.](/autoML/man/autoEnsemble.Rd)

Creates three different ensemble models based on ten different sub-models with three different parameters each. Ensemble models combine the stregnths of each sub-model to create a stronger
overall model. This grouping of models should be used for regression. Models used in the program are:
*  Bagged CART
*  Baysein GLM
*  Generalized Linear Model
*  Generalized Linear Model with Stepwise Feature Selection
*  Linear Model
*  Linear Regression with Stepwise Selection
*  Bayesian Ridge Regression
*  Bayesian Ridge Regression (Model Averaged)
*  Gaussian Process
*  CART


### autoFeat
> [Code is here.](/autoML/R/autoFeat.R) [Documentation is here.](/autoML/man/autoFeat.Rd)

Performs three different types of feature analysis with multiple different parameters to create eight models. The first type is random forrest, the second type is recursive feature elimination, and the third type is a univariate filter. Each type is implemented differently and using different parameters. Several models are returned for further use.


### autoRegress
> [Code is here.](/autoML/R/autoRegress.R) [Documentation is here.](/autoML/man/autoRegress.Rd)

Performs ten different types of regression with eight different parameters and principal component analysis to create eighty models. The different models are:
* Bagged CART
* Baysein GLM
* Generalized Linear Model
* Generalized Linear Model with Stepwise Feature Selection
* Linear Model
* Linear Regression with Stepwise Selection
* Bayesian Ridge Regression
* Bayesian Ridge Regression (Model Averaged)
* Gaussian Process
* CART 
Each of the models above are accessed with the resampling method after the name. To save space, I did not list all eighty models here. The options after it are:
* boot
* boot632
* opBoot
* bootAll
* cv
* repeatCV
* loocv
* lgocv
Models are returned for further use, along with the results of all the models and the best performing model.

### autoSVM
> [Code is here.](/autoML/R/autoSVM.R) [Documentation is here.](/autoML/man/autoSVM.Rd)

Performs a grid search on an SVM with three different resampling methods and four different kernals. The grid search discovers the optimal values for alpha, gamma, and cost. The model is run many, many times so it may run for a long time. Even a medium sized dataset with many features could take hours before it is finished.
