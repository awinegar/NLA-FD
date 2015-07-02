####Some code for making univariate regression trees####

##Packages
library(rpart)
library(party) #Regression trees
library(rpart.plot) #Regression trees
library(partykit) #Regression trees
library(tree) #Regression trees

##Code for URT (example)
fit1<- rpart(RESPONSE_VARIABLE~X_VAR1 + X_VAR_2 + X_VAR_3 + ETC, method="anova", data=YOUR_DATA_FRAME) 
printcp(fit1) #Will show you the variables actually used in the construction
summary(fit1)
fit1.prune<-  prune(fit1, cp=fit1$cptable[which.min(fit1$cptable[,"xerror"]),"CP"])
summary(fit1.prune) #Output for the pruned results 

#R2 is 1-Rel Error
# R2      
1-fit1$cptable[#,3] #Column 3 is the column for rel error. Replace the row # with the row number of the last row from the cptable
  
#Making some plots of the pruned tree 
plot(as.party(fit1prune), tp_args = list(id = FALSE))

#Use this code to build on what you find in the documentation for the rpart package, this will just get you started. 
