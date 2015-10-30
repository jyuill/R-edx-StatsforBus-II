# use file.choose to grab the file directly from your system
MonthlyCloses <- read.csv(file.choose(), header=TRUE)

# identify the class of the dataset - should be 'data.frame'
class(MonthlyCloses)
# get structure
str(MonthlyCloses)
# get summary of all variables
summary(MonthlyCloses)
# get summary of specific variable
summary(MonthlyCloses$Bank)
# view values of specific variable as vector
MonthlyCloses$Bank

?sleep
str(sleep)
class(sleep)
summary(sleep)


