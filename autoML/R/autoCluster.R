#' @export

autoCluster_dev <- function(dat, k) {
  ##### Create where the results will go. #####

  results <- list()

  ##### Method one. K-means. #####

  fit_kmeans <- kmeans(dat, k)

  plot_kmeans <-
    clusplot(
      dat,
      fit_kmeans$cluster,
      color = TRUE,
      shade = TRUE,
      labels = 2,
      lines = 0
    )


  ##### Method two. K-medoids. #####

  fit_pam <- pam(dat, k)

  plot_pam <-
    clusplot(
      dat,
      fit_pam$clustering,
      color = TRUE,
      shade = TRUE,
      labels = 2,
      lines = 0
    )

  fit_pamk <- pamk(dat, k)

  plot_pamk <-
    clusplot(
      dat,
      fit_pamk$pamobject$clustering,
      color = TRUE,
      shade = TRUE,
      labels = 2,
      lines = 0
    )


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
      results[[paste(mod, dis, sep = ".")]] <-
        hclust(d, method = mod)

      j <- j + 1
    }
    i <- i + 1
  }


  ##### Method three. Mixture model based. #####
  # https://towardsdatascience.com/mixture-modelling-from-scratch-in-r-5ab7bfc83eef

  fit_mclust <- Mclust(dat, k)

  plot_mixed <- plot(fit_mclust)

  ##### Create results list. #####

  results$fit.kmeans <- fit_kmeans

  results$fit.pam <- fit_pam

  results$fit.pamk <- fit_pamk

  results$fit.mixed <- fit_mclust

  ##### Plots. #####
  results$plot.kmeans <- plot_kmeans

  results$plot.pam <- plot_pam
  results$plot.pamk <- plot_pamk

  results$plot.mixed <- plot_mixed

  ##### Output return. #####
  return(results)
}