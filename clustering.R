setwd("D:/analytics edge/clustering")
#importing csv file from my working directory.
flower<- read.csv(file.choose(), header=F)
#visualising the structure of flower dataset.
str(flower)
#converting flower dataset to matrix form.
flowerMatrix<- as.matrix(flower)
str(flowerMatrix)
#now converting the flowerMatrix to vector because it'll include all the values from 0 to 1.
flowerVector<- as.vector(flowerMatrix)
str(flowerVector)
#Now using distance function , we are creating a distance matrix which include all the pairwise distances between all the  intensity values in the flower vector. 
distance<- dist(flowerVector, method = "euclidean")
#now we are clustering the intensity values using hierarchical clustering(hclust.)
clusterIntensity<- hclust(distance, method = "ward.D")
#plot the cluster dendogram.
plot(clusterIntensity)
#plotting rectangle around the cluster intensity.
rect.hclust(clusterIntensity, k=3, border = "red")
#now split up the data in three cluster.
flowerClusters<- cutree(clusterIntensity,k=3)
flowerClusters
#now applying tapply to group the values of flowervector according to flowerclusters and apply mean statistics.
tapply(flowerVector, flowerClusters, mean)
#now converting flowerclustering to matrix.
dim(flowerClusters)= c(50,50)
#now using image function to view image of flowerclustering. 
image(flowerClusters, axes=F)
#now using image function to view image of flowerclustering. 
image(flowerMatrix, axes=F, col= grey(seq(0,1,length=256)))
