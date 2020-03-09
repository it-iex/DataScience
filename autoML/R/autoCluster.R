

##### Required libraries. #####
library(fpc)
library(cluster)
library(mclust)

##### Data. ######
dat <- mtcars

##### Data. ######
dat <- mtcars

##### Create where the results will go. #####

results <- list()

##### Method one. K-means. #####

fit_kmeans <- kmeans(dat, k)

#clusplot(mtcars, fit_kmeans$cluster, color=TRUE, shade=TRUE, labels = 2, lines = 0)


##### Method two. K-medoids. #####

fit_pam <- pam(dat, k)

#clusplot(mtcars, fit_pam$pamobject$clustering, color=TRUE, shade=TRUE, labels = 2, lines = 0)

fit_pamk <- pamk(dat, k)

#clusplot(mtcars, fit_pamk$pamobject$clustering, color=TRUE, shade=TRUE, labels = 2, lines = 0)


##### Method two. Hierarchical Clustering #####

# Different parameters to be tested.
distList <-
  c("euclidean",
    "maximum",
    "manhattan",
    "canberra",
    "binary",
    "minkowski")

modelList <-
  c(
    "ward.D",
    "ward.D2",
    "single",
    "complete",
    "average",
    "mcquitty",
    "median",
    "centroid"
  )

i <- 0
j <- 0

# Training the models.

for (mod in modelList) {
  for (dis in distList) {
    # Distance matrix.
    d <- dist(dat, method = dis)

    # Trains, then sends to results.
    results[[paste(mod, dis, sep = ".")]] <- hclust(d, method = mod)

    j <- j + 1
  }
  i <- i + 1
}


##### Method three. Mixture model based. #####
# https://towardsdatascience.com/mixture-modelling-from-scratch-in-r-5ab7bfc83eef

fit_mclust <- Mclust(mydata, k)

# Confusion matrix.
table(y, fit_mclust$classification)


##### Method four. DBscan. #####
#TODO finish this method.
# http://www.sthda.com/english/wiki/wiki.php?id_contents=7940

# Determine proper eps value.


# Perform the calculation.
fit_dbscan <-  fpc::dbscan(df, eps = 0.15, MinPts = 5)

# Use predict.


# Plot.
plot(fit_dbscan, mydata, main = "DBSCAN", frame = FALSE)
