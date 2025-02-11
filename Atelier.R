#Updating R version to 3.6.3
install.packages("installr")
library(installr)
updateR()

#Installing environnement packages
install.packages("FactoMineR")
library(FactoMineR)
install.packages("ggplot2")
library(ggplot2)
install.packages("factoextra")
library(factoextra)


#Loading data
food <- read.csv("C:/Users/PC Gamer/Desktop/food.csv")
#Cheking data
head(food)
#Variables display
plot(food[,-1], pch=16, cex=0.8)

#Appliying ACP on data
food.pca<-PCA(food[,-1], scale.unit=TRUE, graph=F) 
#Displaying ACP summary
summary(food.pca)
#Other way of displaying ACP informations
str(food.pca)

#Proper values calculation
eig.val<-get_eigenvalue(food.pca)  

#Displaying the percentage of explained variances
fviz_eig(food.pca, addlabels = TRUE, ylim = c(0, 70))

#Active variables results
food.var<-get_pca_var(food.pca)

#Displaying variables correlation
fviz_pca_var(food.pca, col.var = "black")

#Displaying individuals
plot(food.pca)
#Or
fviz_pca_ind(food.pca, repel = TRUE )

#Displaying individuals and variables
fviz_pca_biplot(food.pca, repel=TRUE)