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
Learn more about why correlated features matter with these articles: (In supervised learning, why is it bad to have correlated features?)[https://datascience.stackexchange.com/questions/24452/in-supervised-learning-why-is-it-bad-to-have-correlated-features], (Why Feature Correlation Matters …. A Lot!)[https://towardsdatascience.com/why-feature-correlation-matters-a-lot-847e8ba439c4], and (Why exclude highly correlated features when building regression model ??)[https://towardsdatascience.com/why-exclude-highly-correlated-features-when-building-regression-model-34d77a90ea8e].

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

Learn more about ensemble models with these articles: [Ensemble Methods in Machine Learning: What are They and Why Use Them?](https://towardsdatascience.com/ensemble-methods-in-machine-learning-what-are-they-and-why-use-them-68ec3f9fef5f), [Simple guide for ensemble learning methods](https://towardsdatascience.com/simple-guide-for-ensemble-learning-methods-d87cc68705a2), and [Ensemble Learning Methods for Deep Learning Neural Networks](https://machinelearningmastery.com/ensemble-methods-for-deep-learning-neural-networks/)

### autoFeat
> [Code is here.](/autoML/R/autoFeat.R) [Documentation is here.](/autoML/man/autoFeat.Rd)

Performs three different types of feature analysis with multiple different parameters to create eight models. The first type is random forrest, the second type is recursive feature elimination, and the third type is a univariate filter. Each type is implemented differently and using different parameters. Several models are returned for further use.

Learn more about feature selection with these articles: [Feature Selection Techniques in Machine Learning with Python](https://towardsdatascience.com/feature-selection-techniques-in-machine-learning-with-python-f24e7da3f36e), [The 5 Feature Selection Algorithms every Data Scientist should know](https://towardsdatascience.com/the-5-feature-selection-algorithms-every-data-scientist-need-to-know-3a6b566efd2), and [An Introduction to Feature Selection](https://machinelearningmastery.com/an-introduction-to-feature-selection/)

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

Learn more about regression with these articles: [7 Regression Techniques you should know!](https://www.analyticsvidhya.com/blog/2015/08/comprehensive-guide-regression/), [5 Types of Regression and their properties](https://towardsdatascience.com/5-types-of-regression-and-their-properties-c5e1fa12d55e), and [Types of Regression Techniques](https://www.geeksforgeeks.org/types-of-regression-techniques/)

### autoSVM
> [Code is here.](/autoML/R/autoSVM.R) [Documentation is here.](/autoML/man/autoSVM.Rd)

Performs a grid search on an SVM with three different resampling methods and four different kernals. The grid search discovers the optimal values for alpha, gamma, and cost. The model is run many, many times so it may run for a long time. Even a medium sized dataset with many features could take hours before it is finished.

Learn more about SVM models from these articles: [Support Vector Machine — Introduction to Machine Learning Algorithms](https://towardsdatascience.com/support-vector-machine-introduction-to-machine-learning-algorithms-934a444fca47), [Support Vector Machines for Machine Learning](https://machinelearningmastery.com/support-vector-machines-for-machine-learning/), and [Chapter 2 : SVM (Support Vector Machine) — Theory](https://medium.com/machine-learning-101/chapter-2-svm-support-vector-machine-theory-f0812effc72)