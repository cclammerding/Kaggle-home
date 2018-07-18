library(ROCR)

##Train/Test Split##---------------------------------------------------------------------------------------------------------------------------
index <- sample(c("train","test"),nrow(complete),replace = TRUE, prob = c(0.8,02))

complete_split <- split(complete, index)

train <- complete_split$train

test <- complete_split$test

##Build Model##--------------------------------------------------------------------------------------------------------------------------------
fit <- glm(TARGET ~ CNT_CHILDREN + AMT_INCOME_TOTAL + AMT_CREDIT + DAYS_EMPLOYED 
                  + income_credit_ratio + NAME_CONTRACT_TYPE + FLAG_OWN_CAR + CODE_GENDER
                  ,data = train, family = binomial)

summary(fit)

##Evaluate Model##-----------------------------------------------------------------------------------------------------------------------------

test.prediction <- predict(fit, test , type = "response")

#test.prediction<- round(test.prediction)

mean(test.prediction == test$TARGET)

pred <- prediction(test.prediction, test$TARGET)

perf <- performance(pred, measure = "auc")

print(paste("AUC: ", perf@y.values[[1]]))
