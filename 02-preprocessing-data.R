#missing <- sapply(train, function(c) sum(is.na(c)))
library(dplyr)

#Merge---------------------------------------------------------------------------------------


#Feature Engineering---------------------------------------------------------------------------------------

# complete <- complete %>%  mutate(
#   income_credit_ratio = AMT_INCOME_TOTAL / AMT_CREDIT,
#   income_child_ratio = AMT_INCOME_TOTAL / CNT_CHILDREN,
#   TARGET = factor(TARGET, levels = c(1,0), labels = c("yes","no"))
# )

preprocess_data <- function(df){
    df %>%  mutate(
                    income_credit_ratio = AMT_INCOME_TOTAL / AMT_CREDIT,
                    income_child_ratio = AMT_INCOME_TOTAL / CNT_CHILDREN
                  )
}

complete <- preprocess_data(complete)
submit <- preprocess_data(submit)

complete$TARGET <- factor(complete$TARGET, levels = c(1,0), labels = c("yes","no"))
#Split---------------------------------------------------------------------------------------


