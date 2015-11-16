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
