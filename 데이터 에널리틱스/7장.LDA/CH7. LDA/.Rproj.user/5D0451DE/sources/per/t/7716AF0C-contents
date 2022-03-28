####################################################
## Data Preprocessing
####################################################
loan <- read.table('./loan_data_set.csv', header=TRUE, sep=','); head(loan); dim(loan); table(is.na(loan))
loan$Gender

loan[loan==''] <- NA
loan$Gender

loan <- na.omit(loan)
table(is.na(loan))

loan <- loan[,2:ncol(loan)]; head(loan)

loan$Gender <- as.integer(as.factor(loan$Gender))
loan$Married <- as.integer(as.factor(loan$Married))
loan$Dependents <- as.integer(as.factor(loan$Dependents))
loan$Education <- as.integer(as.factor(loan$Education))
loan$Self_Employed <- as.integer(as.factor(loan$Self_Employed))
loan$Property_Area <- as.integer(as.factor(loan$Property_Area))
loan$Loan_Status <- as.integer(as.factor(loan$Loan_Status))-1



loan$idx <- 1:nrow(loan)
loan <- loan[,c(ncol(loan),1:ncol(loan)-1)]

####################################################
## Data Splitting
####################################################
install.packages('splitstackshape')
library(splitstackshape)

pSeed <- 12346
set.seed(pSeed)

loan.tra <- stratified(loan, 'Loan_Status', 0.6)

## ONLY TEST for STRATIFIED SAMPLING
loan.tra <- loan.tra[order(loan.tra$idx),]
loan.rest <- loan[loan$idx %in% loan.tra$idx,]
loan.rest <- loan.rest[order(loan.rest$idx),]
table(loan.tra$idx == loan.rest$idx)
table(loan.tra$ApplicantIncome == loan.rest$ApplicantIncome)
## ONLY TEST for STRATIFIED SAMPLING

loan.rest <- loan[! loan$idx %in% loan.tra$idx,]

loan.val <- stratified(loan.rest, 'Loan_Status', 0.5)
loan.tes <- loan.rest[! loan.rest$idx %in% loan.val$idx,]

loan.tra <- subset(loan.tra, select=-c(idx)); head(loan.tra)
loan.val <- subset(loan.val, select=-c(idx)); head(loan.val)
loan.tes <- subset(loan.tes, select=-c(idx)); head(loan.tes)

## ONLY TEST for STRATIFIED SAMPLING
t <- table(loan.tra$Loan_Status); t; t[1]/t[2] 
t <- table(loan.val$Loan_Status); t; t[1]/t[2] 
t <- table(loan.tes$Loan_Status); t; t[1]/t[2]
## ONLY TEST for STRATIFIED SAMPLING

####################################################
## LDA 
####################################################
install.packages('MASS')
library(MASS)
library(caret)

LDA_model <- lda(Loan_Status~., loan.tra)

Predict.tra <- predict(LDA_model, loan.tra)$class
cTab.tra <- table(Actual=loan.tra$Loan_Status, Predict.tra); cTab.tra
cM.tra <- confusionMatrix(t(cTab.tra), positive='0'); cM.tra
Accu.tra <- cM.tra$overall['Accuracy']
cTab.tra; Accu.tra

Predict.val <- predict(LDA_model, loan.val)$class
cTab.val <- table(Actual=loan.val$Loan_Status, Predict.val); cTab.val
cM.val <- confusionMatrix(t(cTab.val), positive='0'); cM.val
Accu.val <- cM.val$overall['Accuracy']
cTab.val; Accu.val

####################################################
## Logistic Regression(S_model)
####################################################
A_model <- glm(Loan_Status~., loan.tra, family=binomial)
All_var <- formula(A_model);
summary(A_model)

startModel <- glm(Loan_Status~1, loan.tra, family=binomial)
summary(startModel)

s_Result <- step(startModel, direction='both', scope=All_var)
s_var <- as.formula(s_Result$call); s_var

S_model <- glm(s_var, loan.tra, family=binomial)
summary(S_model)

predTra <- predict(S_model, loan.tra, type='response')
Predict.tra <- ifelse(predTra>=0.5, 1, 0)
cTab.tra <- table(Actual=loan.tra$Loan_Status, Predict.tra); cTab.tra
cM.tra <- confusionMatrix(t(cTab.tra), positive='0'); cM.tra
Accu.tra <- cM.tra$overall['Accuracy']
cTab.tra; Accu.tra

predVal <- predict(S_model, loan.val, type='response')
Predict.val <- ifelse(predVal>=0.5, 1, 0)
cTab.val <- table(Actual=loan.val$Loan_Status, Predict.val); cTab.val
cM.val <- confusionMatrix(t(cTab.val), positive='0'); cM.val
Accu.val <- cM.val$overall['Accuracy']
cTab.val; Accu.val
