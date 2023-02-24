data(iris)
head(iris)
 
#PCA 
myPr <- prcomp(iris[, -5])#pca by removing species col
myPr <- prcomp(iris[, -5], scale = TRUE)
plot(iris$Sepal.Length, iris$Sepal.Width)
plot(scale(iris$Sepal.Length), scale(iris$Sepal.Width))
plot((iris$Sepal.Length - mean(iris$Sepal.Length)) / sd(iris$Sepal.Length))
myPr
summary(myPr)
plot(myPr, type = "l")
biplot(myPr)
biplot(myPr, scale = 0)

# extracting PC Scores
str(myPr)
myPr$x #this gives us the location of the PC's
iris2 <- cbind(iris, myPr$x[,1:2])#extracting and binding PC1,PC2 into new df
head(iris2)

# plotting with gg plot
library(ggplot2)
ggplot(iris2, aes(PC1, PC2, col = Species, fill = Species)) +
  stat_ellipse(geom = "polygon", col = "black", alpha = 0.5) +
  geom_point(shape = 21, col = "black")
# Correlation between variables and principal components
cor(iris[, -5], iris2[, 6:7])
