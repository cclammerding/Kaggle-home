library(readr)

complete <- read_csv(file.path("raw-data","application_train.csv"))
submit <- read_csv(file.path("raw-data","application_test.csv"))

##View(complete)

set.seed(42)


