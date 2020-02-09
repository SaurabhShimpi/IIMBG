mtcars proportion of am to be maintained
train_MTC 70%
test_MTC 30%
mtcars
set.seed(34)
library(caTools)
split1 = sample.split(mtcars$am, SplitRatio=0.7)
train_MTC = subset(mtcars, split == TRUE)
test_MTC = subset(mtcars, split == FALSE)  
dim(train_MTC)
dim(test_MTC)
table(train_MTC$am)
table(test_MTC$am)
prop.table(table(train_MTC$am))
prop.table(table(test_MTC$am))

#another method for partition
library(caret)
install.packages('caret')
library(caret)
#l1 = createDataPartition(y=factor(mtcars$am), p=0.7, list = FALSE) 
intrain = createDataPartition(y=factor(mtcars$am), p=0.7, list = FALSE)
intrain
mtcars[-intrain,]
training = mtcars[intrain,]
testing = mtcars[-intrain,]
training

#simplest method
s1 = sample(1:nrow(mtcars), size=0.7 * nrow(mtcars))
mtT1 = mtcars[s1,]
mtT2 = mtcars[-s1,]
dim(mtT1)
dim(mtT2)

#4th method
library(dplyr)


logitmodel1 = glm()