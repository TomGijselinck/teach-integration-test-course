setwd("D:/GI Werk/DataCamp/DataSets")

## Ch 4: script 1

x <- seq(0,10,0.2)
z <- rnorm(length(x), 0, 1.5)
y <- (x-5)^2 + z
plot(x,y, pch = 16, col = "red")

y <- 2*x + z
plot(x,y, pch = 16, col = "red")

shop_data <- read.csv(file="sales_data.csv", header=TRUE, sep=",")
plot(sales ~ ads, data = shop_data, pch = 16, col = 2, xlab = "advertisement", ylab = "net sales", cex = 1.3)
lm_sales <- lm(sales ~ ads, data = shop_data)
ads_new <- data.frame("ads" = 10)
pred <- predict(lm_sales, ads_new)
abline(lm_sales$coefficients, lwd = 2)
points(lm_sales$fitted.values ~ ads, data = shop_data, cex = 1.3)
with(shop_data, segments(ads, sales, ads, lm_sales$fitted.values))

summary(lm_sales)
shop_data$sales[2]
lm_sales$residuals[2]
lm_sales$fitted[2]
## Ch 4: script 2

shop_data <- read.csv(file="sales_data.csv", header=TRUE, sep=",")
plot(sales ~ ads, data = shop_data, pch = 16, col = "red", xlab = "advertisement", ylab = "net sales")
plot(sales ~ comp, data = shop_data, pch = 16, col = "red", xlab = "nearby competition", ylab = "sales")
lm_shop <- lm(sales ~ ads + comp, data = shop_data)
summary(lm_shop)

par(mfrow=c(1,2))
plot(lm_shop$fitted.values,  lm_shop$residuals, main = "Residual Plot", xlab = "Estimated Sales", ylab = "Residuals", pch = 16, col = "red")
qqnorm(lm_shop$residuals, ylab = "Residual Quantiles", pch = 16, col = "red")
qqline(lm_shop$residuals, probs = c(0.2, 0.8), lwd = 2)
plot(lm_shop)

par(mfrow=c(1,1))

## Ch 4: script 3

set.seed(1)
x <- c(runif(70, 1.5, 3), runif(50, 3, 5), runif(65, 5, 6.5))
z <- rnorm(length(x), 0, 1.5)
y <- (x-2)*(x-4)*(x-6) +50 + z
plot(x,y, pch = 16, col = "red")


my_knn <- function(x_pred, x, y, K){
  
  n <- nrow(x)
  m <- length(x_pred)
  
  predict_knn <- rep(0, m)
  for (i in 1:m) {
    
    dist <- abs(x_pred[i]-x)
    sort_index <- order(dist)
    predict_knn[i] <- mean(y[sort_index[1:K]])
    
  }
  return(predict_knn)
}

plot(x,y, pch = 16, col = "red", cex = 1.2)

xp <- seq(1.5, 6.5, 0.1)
yp <- my_knn(xp, x, y, length(x)/5)
lines(xp, yp, col = "blue", lwd = 3)

xt <- x[(x > 4.5) & (x < 5)]
yt <- y[(x > 4.5) & (x < 5)]
plot(xt, yt, pch = 16, xlab = "x", ylab = "y", col = "red", cex = 1.2)
abline(v = 4.7, col = "blue", lty = 3, lwd = 2)
dist <- abs(4.7-x)
sort_index <-order(dist)[1:4]
points(x[sort_index], y[sort_index], pch = 16, col = "green", cex= 1.2)
segments(x[sort_index], y[sort_index], rep(4.4, 4), y[sort_index], lty = 3, lwd = 2, col = "green")


plot(xt, yt, pch = 16, xlab = "x", ylab = "y", col = "red", cex = 1.2)
points(x[sort_index], y[sort_index], pch = 16, col = "green", cex= 1.2)
abline(v = 4.7, col = "blue", lty = 3, lwd = 2)
abline(h = mean(y[sort_index]), lty = 3, lwd = 2, col = "blue")
points(4.7, mean(y[sort_index]), col = "blue", pch = 15, cex = 1.2)

plot(xt, yt, pch = 16, xlab = "x", ylab = "y", col = "red", cex = 1.2)
points(4.7, mean(y[sort_index]), col = "blue", pch = 15, cex = 2)


    ## Ch 5: script 1
library("MASS")
set.seed(1)

# Step 1
mu = c(1,1)
sigma = matrix(c(1,0.2,0.2,1), ncol = 2, nrow = 2, byrow = TRUE)
z_1 <- mvrnorm(100, mu = mu, Sigma = sigma)
plot(z_1, pch = 16, xlim = c(-2, 14), ylim = c(-6, 9), xlab = "x", ylab = "y", main = "k-means: Step 1")

mu = c(8,5)
sigma = matrix(c(1,0.2,0.2,1), ncol = 2, nrow = 2, byrow = TRUE)
z_2 <- mvrnorm(100, mu = mu, Sigma = sigma)
points(z_2, pch = 16)

mu <- c(11, -2)
sigma = matrix(c(1,0.2,0.2,1), ncol = 2, nrow = 2, byrow = TRUE)
z_3 <- mvrnorm(100, mu = mu, Sigma = sigma)
points(z_3, pch = 16)

z = rbind(z_1, z_2, z_3)

centers = matrix(c(2.5,4, 12, 4, 11, -5), ncol = 3, nrow = 2)
points(centers[1,1], centers[2,1], pch = 22, bg = "darkred", col = "black", cex = 2)
points(centers[1,2], centers[2,2], pch = 22, bg = "darkgreen", col = "black", cex = 2)
points(centers[1,3], centers[2,3], pch = 22, bg = "darkblue", col = "black", cex = 2)

# Step 2

n <- nrow(z)
dis <- matrix(rep(0,3*n), nrow = n, ncol = 3, byrow = TRUE)
for (i in z) {
  for (j in 1:3) {
    
    dis[i,j] <- sqrt((z[i,1]-centers[1,j])^2+(z[i,2]-centers[2,j])^2)
    
  }
}
  
clusters = apply(dis, 1, which.min)

plot(z[,1], z[,2], col = clusters + 1, pch = 16, xlim = c(-2, 14), ylim = c(-6, 9), xlab = "x", ylab = "y", main = "k-means: Step 2")
points(centers[1,1], centers[2,1], pch = 22, bg = "darkred", col = "black", cex = 2)
points(centers[1,2], centers[2,2], pch = 22, bg = "darkgreen", col = "black", cex = 2)
points(centers[1,3], centers[2,3], pch = 22, bg = "darkblue", col = "black", cex = 2)



# Step 3

z_1 <- z[clusters == 1, ]
z_2 <- z[clusters == 2, ]
z_3 <- z[clusters == 3, ]

centers[,1] <- apply(z_1, 2, mean)
centers[,2] <- apply(z_2, 2, mean)
centers[,3] <- apply(z_3, 2, mean)

plot(z[,1], z[,2], col = clusters + 1, pch = 16, xlim = c(-2, 14), ylim = c(-6, 9), xlab = "x", ylab = "y", main = "k-means: Step 3")
points(centers[1,1], centers[2,1], pch = 22, bg = "darkred", col = "black", cex = 2)
points(centers[1,2], centers[2,2], pch = 22, bg = "darkgreen", col = "black", cex = 2)
points(centers[1,3], centers[2,3], pch = 22, bg = "darkblue", col = "black", cex = 2)


# Step 4

dist <- matrix(rep(0,3*n), nrow = n, ncol = 3, byrow = TRUE)
for (i in z) {
  for (j in 1:3) {
    
    dist[i,j] <- sqrt((z[i,1]-centers[1,j])^2+(z[i,2]-centers[2,j])^2)
    
  }
}

clusters = apply(dist, 1, which.min)

plot(z[,1], z[,2], col = clusters + 1, pch = 16, xlim = c(-2, 14), ylim = c(-6, 9), xlab = "x", ylab = "y", main = "k-means: Step 4")
points(centers[1,1], centers[2,1], pch = 22, bg = "darkred", col = "black", cex = 2)
points(centers[1,2], centers[2,2], pch = 22, bg = "darkgreen", col = "black", cex = 2)
points(centers[1,3], centers[2,3], pch = 22, bg = "darkblue", col = "black", cex = 2)


z_1 <- z[clusters == 1, ]
z_2 <- z[clusters == 2, ]
z_3 <- z[clusters == 3, ]

centers[,1] <- apply(z_1, 2, mean)
centers[,2] <- apply(z_2, 2, mean)
centers[,3] <- apply(z_3, 2, mean)

plot(z[,1], z[,2], col = clusters + 1, pch = 16, xlim = c(-2, 15), ylim = c(-6, 9), xlab = "x", ylab = "y", main = "k-means: Step 4")
points(centers[1,1], centers[2,1], pch = 22, bg = "darkred", col = "black", cex = 2)
points(centers[1,2], centers[2,2], pch = 22, bg = "darkgreen", col = "black", cex = 2)
points(centers[1,3], centers[2,3], pch = 22, bg = "darkblue", col = "black", cex = 2)

ratio_ss <- c(1, 0.34, 0.12, 0.09, 0.08, 0.06, 0.05)
plot(ratio_ss, type = "b")

## Ch 5: script 2

dist_1 <- as.matrix(dist(z_1))
which(dist_1 == dist_1[which.max(dist_1)], arr.ind = TRUE)
segments(z[61, 1], z[61, 2], z[14, 1], z[14, 2], lwd = 2)

dist_2 <- as.matrix(dist(z_2))
which(dist_2 == dist_2[which.max(dist_2)], arr.ind = TRUE)
segments(z_2[32, 1], z_2[32, 2], z_2[6, 1], z_2[6, 2], lwd = 2)

dist_3 <- as.matrix(dist(z_3))
which(dist_3 == dist_3[which.max(dist_3)], arr.ind = TRUE)
segments(z_3[95, 1], z_3[95, 2], z_3[46, 1], z_3[46, 2], lwd = 2)

intercluster <- function(z1, z2)
{
  n1 <- nrow(z1)
  n2 <- nrow(z2)
  
  mins <- matrix(rep(0, 2*n1), ncol = 2, nrow = n1)
  Ind <- 0
  for (i in 1:n1) {
    dists <- 0
    
    for (j in 1:n2) {
      dists[j] <- (z1[i, 1]-z2[j,1])^2 + (z1[i, 2]-z2[j,2])^2
    }
    mins[i, 1] <- which.min(dists)
    mins[i, 2] <- min(dists)
  }
  Ind[1] <- which.min(mins[,2])
  Ind[2] <- mins[Ind[1], 1]
  
  return(Ind)
}

Ind <- intercluster(z_1, z_2)
segments(z_1[Ind[1], 1], z_1[Ind[1], 2], z_2[Ind[2], 1], z_2[Ind[2], 2], lwd = 2, lty = 2)
Ind <- intercluster(z_3, z_2)
segments(z_3[Ind[1], 1], z_3[Ind[1], 2], z_2[Ind[2], 1], z_2[Ind[2], 2], lwd = 2, lty = 2)
Ind <- intercluster(z_1, z_3)
segments(z_1[Ind[1], 1], z_1[Ind[1], 2], z_3[Ind[2], 1], z_3[Ind[2], 2], lwd = 2, lty = 2)


##
set.seed(1)
cars <- as.data.frame(cbind(mtcars$wt, mtcars$hp))
colnames(cars) <- c("wt", "hp")
rownames(cars) <- attributes(mtcars)$row.names

km_cars <- kmeans(cars, 2)
km_cars$cluster
centers_cars <- km_cars$centers

plot(cars, col = km_cars$cluster)
points(centers_cars, pch = 22, bg = c(1,2), cex = 2)

