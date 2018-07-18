#missing <- sapply(train, function(c) sum(is.na(c)))
library(dplyr)

#Merge---------------------------------------------------------------------------------------


#Feature Engineering---------------------------------------------------------------------------------------

complete <- complete %>%  mutate(
  income_credit_ratio = AMT_INCOME_TOTAL / AMT_CREDIT
)

#Split---------------------------------------------------------------------------------------


