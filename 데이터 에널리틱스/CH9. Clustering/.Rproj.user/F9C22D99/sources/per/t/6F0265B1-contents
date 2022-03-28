####################################################
## Data Preprocessing
####################################################
uk <- read.table('./UserKM.csv', header=TRUE, sep=',', stringsAsFactors = FALSE); head(uk); dim(uk); table(is.na(uk))


uk$UNS[uk$UNS=='very_low'] <- '4V_low'
uk$UNS[uk$UNS=='High'] <- '1High'
uk$UNS[uk$UNS=='Middle'] <- '2Middle'
uk$UNS[uk$UNS=='Low'] <- '3Low'



UserAtt <- subset(uk, select=-c(UNS))

####################################################
## K-means Clustering
####################################################
library(stats)
pSeed <- 12346
set.seed(pSeed)

kmResult <- kmeans(UserAtt, centers=2, iter.max=100)
uk$Cluster <- kmResult$cluster; head(uk)
aggregate(data=uk, UNS~Cluster, length)
tab <- table(uk$UNS, kmResult$cluster); tab
round((prop.table(tab, margin=2)*100), digit=2)

kmResult <- kmeans(UserAtt, centers=3, iter.max=100)
uk$Cluster <- kmResult$cluster; head(uk)
aggregate(data=uk, UNS~Cluster, length)
tab <- table(uk$UNS, kmResult$cluster); tab
round((prop.table(tab, margin=2)*100), digit=2)

kmResult <- kmeans(UserAtt, centers=4, iter.max=100)
uk$Cluster <- kmResult$cluster; head(uk)
aggregate(data=uk, UNS~Cluster, length)
tab <- table(uk$UNS, kmResult$cluster); tab
round((prop.table(tab, margin=2)*100), digit=2)

kmResult <- kmeans(UserAtt, centers=5, iter.max=100)
uk$Cluster <- kmResult$cluster; head(uk)
aggregate(data=uk, UNS~Cluster, length)
tab <- table(uk$UNS, kmResult$cluster); tab
round((prop.table(tab, margin=2)*100), digit=2)

kmResult <- kmeans(UserAtt, centers=6, iter.max=100)
uk$Cluster <- kmResult$cluster; head(uk)
aggregate(data=uk, UNS~Cluster, length)
tab <- table(uk$UNS, kmResult$cluster); tab
round((prop.table(tab, margin=2)*100), digit=2)

kmResult <- kmeans(UserAtt, centers=7, iter.max=100)
uk$Cluster <- kmResult$cluster; head(uk)
aggregate(data=uk, UNS~Cluster, length)
tab <- table(uk$UNS, kmResult$cluster); tab
round((prop.table(tab, margin=2)*100), digit=2)

