####################################################
## Read Transactions
####################################################
#install.packages('arules')
library(arules)

tran <- read.transactions('Assocs2.csv', sep=',', format='basket', skip=1, cols=1); dim(tran)
inspect(tran[1:5])


####################################################
## Association Analysis
####################################################
itemFrequency(tran)
itemFrequencyPlot(tran, support=0.1)
itemFrequencyPlot(tran, topN=20)

apriori(tran)

aRules <- apriori(tran, parameter=list(supp=0.05, conf=0.5))

inspect(aRules)
inspect(aRules[1:10])
inspect(sort(aRules, by='lift'))
inspect(sort(aRules, by='lift')[1:10])
inspect(sort(aRules, by='confidence', decreasing=FALSE))

fishRules <- subset(aRules, items %in% 'fish')
inspect(sort(fishRules, by='lift'))

fishRules <- subset(aRules, items %in% 'fish' & confidence>0.8)
inspect(sort(fishRules, by='lift'))

beerchickenRules <- subset(aRules, items %ain% c('beer', 'chicken')) 
inspect(sort(beerchickenRules, by='lift'))

beerchickenRules_ <- subset(aRules, items %in% c('beer', 'chicken')) 
inspect(sort(beerchickenRules_, by='lift'))


####################################################
## Read Transaction Sequences
####################################################
#install.packages('arulesSequences')
library(arulesSequences)
#install.packages('rgr')
library(rgr)

csv.data <- read.csv('Assocs2Seq.csv', header=TRUE)
write.table(csv.data, 'Assocs2Seq.txt', sep=' ',
            row.names=FALSE, col.names=FALSE, quote=FALSE, na='')

seqTran <- read_baskets('Assocs2Seq.txt', sep='[ \t]+',
            info=c('sequenceID', 'eventID', 'Size'))
inspect(seqTran[1:5])

####################################################
## Analysis Sequences
####################################################
Seq0 <- cspade(seqTran, control=list(verbose=TRUE, tidLists=TRUE))
nrow(Seq0)

Seq <- cspade(seqTran, parameter=list(support=0.15),
              control=list(verbose=TRUE, tidLists=TRUE))
SeqSub <- Seq[size(Seq,'itemsets')>1]              
SeqSub.df <- as(SeqSub, 'data.frame')
gx.sort.df(SeqSub.df, ~ -support)[1:20,]

