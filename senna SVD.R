### 1. For black and white picture.

#Package "imager" - Image Processing Library Based on 'CImg'
#Fast image processing for images in up to 4 dimensions (two spatial dimensions, one time/depth dimension, one colour dimension).
# Package "imager" depends on magrittr package.
#Package "magrittr"- A Forward-Pipe Operator for R
#Provides a mechanism for chaining commands with a new forward-pipe operator, %>%. This operator will forward a value, or the result of an expression, into the next function call/expression.


install.packages("imager")
install.packages("magrittr")
library(imager)
library(magrittr)

#load.image function loads image from a file/ url.
test<-load.image("C:/Users/Sri Harsha/Pictures/Screenshots/best-f1-cars-of-all-time-1-mclaren-mp4-4-ayrton-senna-f1-1988-monaco-mi-goodwood-07092020.jpg")
test
#grayscale function converts from RGB images to grayscale
megray<-grayscale(test)
plot(megray)
dim(megray)
plot(megray,axes=FALSE,main="aguero")

#svd function compute the singular-value decomposition of a rectangular matrix.
svd1<-svd(scale(megray))

#str function tells the structure of the object and information about the class, length and content of each column.
str(svd1)

#matrix multiplication of U,D and V* (V transpose)
#including only first 5 singluar vectors
approx5<-svd1$u[,1:5] %*% diag(svd1$d[1:5]) %*% t(svd1$v[,1:5])
#including only first 10 singular vectors
approx10<-svd1$u[,1:10] %*% diag(svd1$d[1:10]) %*% t(svd1$v[,1:10])
#including only first 50 singular vectors
approx50<-svd1$u[,1:50] %*% diag(svd1$d[1:50]) %*% t(svd1$v[,1:50])
#including only first 75 singular vectors
approx75<-svd1$u[,1:75] %*% diag(svd1$d[1:75]) %*% t(svd1$v[,1:75])
#including only first 100 singular vectors
approx120<-svd1$u[,1:120] %*% diag(svd1$d[1:120]) %*% t(svd1$v[,1:120])

#par function allows to set parameters to the plot. The mfrow function allows to split the screen in several panels. It takes in a vector of form c(m, n) which divides the given plot into m*n array of subplots. The mar function sets the margin sizes in the following order: bottom, left, top, and right.

par(mfrow=c(2,3),mar=c(1,1,1,1))
#plotting for reduced images
#as.cimg function converts data into cimg objects. cimg is a class for storing image.
plot(as.cimg(approx5),main="(a) 5 singular Vectors",axes=FALSE)
plot(as.cimg(approx10),main="(b) 10 singular Vectors ",axes=FALSE)
plot(as.cimg(approx50),main="(c) 50 singular Vectors",axes=FALSE)
plot(as.cimg(approx75),main="(d) 75 singular Vectors",axes=FALSE)
plot(as.cimg(approx120),main="(e) 120 singular Vectors",axes=FALSE)
plot(as.cimg(megray),main="(f) Full image",axes=FALSE