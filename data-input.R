# check what the working directory is
getwd()
# set working directory to one level higher than current
setwd("..")
# confirm wd is one level higher
getwd()
# in RStudio use Session > Set Working Directory > To Project Directory to reset
# confirm
getwd()

# get data file by changing working directory to where file is - convoluted but just demonstration
directory <- dirname(file.choose()) # select file you want 
setwd(directory) # set working directory to where file is
MonthlyCloses <- read.csv("MonthlyCloses.csv", header=TRUE) # get file from working directory 

# Much simpler options:
# use file.choose to grab the file directly from your system
MonthlyCloses <- read.csv(file.choose(), header=TRUE)
# or if you know the file location on the Internet, you can grab directly
MonthlyCloses <- read.csv("https://courses.edx.org/asset-v1:IIMBx+QM101.2x+2T2016+type@asset+block/MonthlyCloses.csv", header=TRUE)
