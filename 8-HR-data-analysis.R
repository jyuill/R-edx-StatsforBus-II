HRSalaries <- read.csv("C:/Users/jyuill/Google Drive/R-code/R-edx-StatsforBus-II/data/HRSalaries.csv")
View(HRSalaries)

str(HRSalaries)
head(HRSalaries)
summary(HRSalaries)
nrow(HRSalaries)

hist(HRSalaries$Annual.Salary)
hist(HRSalaries$Review.Score)

plot(Annual.Salary ~ Review.Score,data=HRSalaries)
lms <- lm(Annual.Salary ~ Review.Score,data=HRSalaries)
abline(lms, col="red")
coef(lms)

cor(HRSalaries$Annual.Salary,HRSalaries$Review.Score)
library(Hmisc)
rcorr(HRSalaries$Annual.Salary,HRSalaries$Review.Score, type="pearson")

Salave <- aggregate(Annual.Salary ~ Department, HRSalaries, mean)
# set margins, starting at bottom going clock-wise around
par(mar=c(10,4,1,1))
# cex.names sets size of x labels, las=2 rotates them vertically
barplot(Salave$Annual.Salary, names.arg=Salave$Department,cex.names=.8,axis.lty=1,las=2)
boxplot(HRSalaries$Annual.Salary ~ HRSalaries$Department, las=2)

# count number of rows in each department
Deptcount <- aggregate(Annual.Salary ~ Department, HRSalaries, length)
barplot(Deptcount$Annual.Salary, names.arg=Deptcount$Department,cex.names=.9,las=2)
