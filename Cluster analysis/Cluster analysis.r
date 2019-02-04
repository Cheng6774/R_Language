# Required libraries
library(cluster)
library(ggplot2)

## DATA PREPARATION ##
# Load data
product <- read.csv("M2_IFI_Data_Product.csv", header = TRUE, sep = ",", dec = ".")
attach(product)
View(product)

# Delete variable ID
product <- product[,-1]

# Modifiy Children variable type
product$Children <- as.factor(product$Children)

# Compute distance matrix
dmatrix <- daisy(product)
summary(dmatrix)

## K-MEANS CLUSTERING ##

# K-means clustering for k in [4,8]
km4 <- kmeans(dmatrix, 4)
km5 <- kmeans(dmatrix, 5)
km6 <- kmeans(dmatrix, 6)
km7 <- kmeans(dmatrix, 7)
km8 <- kmeans(dmatrix, 8)

# Add column with cluster number in the product data frame
product <- data.frame(product, km4$cluster)
product <- data.frame(product, km5$cluster)
product <- data.frame(product, km6$cluster)
product <- data.frame(product, km7$cluster)
product <- data.frame(product, km8$cluster)
attach(product)

# Distribution of classes (Product=Oui/Non) by cluster
table(km4.cluster, Product)
table(km5.cluster, Product)
table(km6.cluster, Product)
table(km7.cluster, Product)
table(km8.cluster, Product)

# Histograms of cluster sizes with class in color
qplot(km4$cluster, data=product, fill=Product)
qplot(km5$cluster, data=product, fill=Product)
qplot(km6$cluster, data=product, fill=Product)
qplot(km7$cluster, data=product, fill=Product)
qplot(km8$cluster, data=product, fill=Product)

#??? Display distribution of classes for 4-means clusters vs. Chlidren and Family_Quotient
qplot(Children, km4$cluster, data=product, color=Product) + geom_jitter(width = 0.3, height = 0.3)
qplot(Family_Quotient, km4$cluster, data=product, color=Product) + geom_jitter(width = 0, height = 0.3)

## HIERARCHICAL CLUSTERING ##

# Run the hclust algorithm
hc <- hclust(dmatrix, method="ward.D2")

# Display the dendrogram
plot(hc)

# Generate clusters for different k values
ghc4 <- cutree(hc, k=4)
ghc5 <- cutree(hc, k=5)
ghc6 <- cutree(hc, k=6)
ghc7 <- cutree(hc, k=7)
ghc8 <- cutree(hc, k=8)

# Distribution of classes (Product=Oui/Non) by cluster
product <- data.frame(product, ghc4)
product <- data.frame(product, ghc5)
product <- data.frame(product, ghc6)
product <- data.frame(product, ghc7)
product <- data.frame(product, ghc8)
table(product$ghc4, Product)
table(product$ghc5, Product)
table(product$ghc6, Product)
table(product$ghc7, Product)
table(product$ghc8, Product)

# Display clusters for k in [4,8]
rect.hclust(hc, k=4, border="red")
rect.hclust(hc, k=5, border="blue")
rect.hclust(hc, k=6, border="green")
rect.hclust(hc, k=7, border="gold")
rect.hclust(hc, k=8, border="skyblue")

# Histograms of cluster sizes with class in color
qplot(product$ghc4, data=product, fill=Product)
qplot(product$ghc5, data=product, fill=Product)
qplot(product$ghc6, data=product, fill=Product)
qplot(product$ghc7, data=product, fill=Product)
qplot(product$ghc8, data=product, fill=Product)

## FOR LOOPS #

# Computing distance matrix
dmatrix <- daisy(product)

# K-means executions for a range of k values
for (i in 4:8){
  km <- kmeans(dmatrix, i)
  product <- data.frame(product, km$cluster)
  print(table(km$cluster, Product))
  print(qplot(km$cluster, data=product, fill=Product))
}  
