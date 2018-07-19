library(ROCR)
library(dplyr)
library(caret)
library(rpart)
library(vcdExtra)
library(Epi)
library(mlbench)
library(rattle)

##Train/Test Split##---------------------------------------------------------------------------------------------------------------------------
# index <- sample(c("train","test"),nrow(complete),replace = TRUE, prob = c(0.8,02))
# 
# complete_split <- split(complete, index)
# 
# train <- complete_split$train
# 
# test <- complete_split$test

##Build Model##--------------------------------------------------------------------------------------------------------------------------------
TRCONTROL <- trainControl(
  method = "cv"
  ,number = 10
  ,classProbs = TRUE
  ,summaryFunction = twoClassSummary
  ,sampling = "smote"
  ,verboseIter = TRUE
)

fit <- train(
              TARGET ~ 
                        DAYS_EMPLOYED 
                      + NAME_INCOME_TYPE
                      + NAME_CONTRACT_TYPE
                      + FLAG_OWN_CAR
                      + income_credit_ratio  
                      + income_child_ratio
              , data = complete[1:50000,]
              , method = "rpart"
              #, na.action = na.omit
              , metric = "ROC"
              , trControl = TRCONTROL
            )

#summary(fit)
fit$results

##Evaluate Model##-----------------------------------------------------------------------------------------------------------------------------

# test.prediction <- predict(fit, test , type = "response")
# 
# mean(test.prediction == test$TARGET)
# 
# pred <- prediction(test.prediction, test$TARGET)
# 
# perf <- performance(pred, measure = "auc")
# 
# print(paste("AUC: ", perf@y.values[[1]]))


