# This file essentially duplicates 'SalaryAnalysis.R' provided by the course
# this is me going through the exercises

getwd()
library(car) # for normality plots
library(moments) # for skew
library(lattice)

Metro <- read.csv("data/HRSalaries.csv", header=TRUE)
head(Metro)

colnames(Metro) <- c("EmployeeID","Title","Department","AnnualSalary","ReviewScore")
head(Metro)

muSal <- mean(Metro$AnnualSalary)
sdSal <- sd(Metro$AnnualSalary)

hist(Metro$AnnualSalary, breaks=25,main="",xlab="Annual Salary",
     col=colors()[25:40])
abline(v=muSal, col="red", lwd=2)
title(main="Salary Distrib", sub=bquote(paste(mu,"=$",.(muSal)," ",sigma="=$",.(sdSal))))

# Calculate skew
skewSal <- skewness(Metro$AnnualSalary)
# Display skew on chart
text(15000,6000,paste("Skew:",round(skewSal,1)))

boxplot(Metro$AnnualSalary,
        horizontal=TRUE,
        main="Salaries",
        pch=16, cex=0.7, col="red")

# check for normality
qqPlot(Metro$AnnualSalary, ylab="", main="QQ Plot: NOT Normal if Blue deviates from Red", las=2,
       pch=16, col="navy", cex=0.7)

# Compare all departments
par(mai=c(1,2.5,0.5,0.5)) # sets size of margins from bottom clockwise
par(cex.axis=0.75) # sets size of both axes to 75% of default
boxplot(AnnualSalary ~ Department,
        horizontal=TRUE,
        main="Salaries Across Dept",
        las=2,
        range=1.5,
        pch=16,cex=0.7, col=colors()[20:40],
        data=Metro)

# analyse review scores
muRS <- mean(Metro$ReviewScore)
sdRS <- sd(Metro$ReviewScore)
hist(Metro$ReviewScore, breaks=25,
     main="",
     xlab="Review Scores",
     col=colors()[28])
abline(v=muRS, col="red", lwd=3)

# review scores normally distributed?
qqPlot(Metro$ReviewScore, ylab="", main="QQ Plot: NOT Norm if Blue Deviates",
       pch=16, col="navy", cex=0.7)

boxplot(ReviewScore ~ Department,
        horizontal=TRUE,
        main="Reviews Across Dept",
        las=2,
        range=1.5, # sets whisker ends to this times interquartile range
        pch=16, cex=0.7, col=colors()[26],
        data=Metro)

### Additional exercises

min(Metro$ReviewScore) # min review score
which.min(Metro$ReviewScore) # row num for min score
Metro[2665,]
Metro[which.min(Metro$ReviewScore),]
Metro[which.max(Metro$ReviewScore),]
Metro[which.max(Metro$AnnualSalary),]
Metro[which.min(Metro$AnnualSalary),]
# number of rows with Review Score between 5 and 7 (inclusive)
metro5 <- subset(Metro,ReviewScore > 4.9)
metro7 <- subset(metro5,ReviewScore <7.1)
# or use dplyr to make filtering easy
library(dplyr) # use dplyr to make filtering easy
metro57 <- filter(Metro, ReviewScore > 4.9 & ReviewScore < 7.1)

