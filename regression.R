#simple linear regression
women
head(women)
plot(women)
cor(women)
cov(women$height, women$weight)
cor(women$height, women$weight)

model = lm(weight ~ height, data = women )
model
summary(model)
range(women$height)
residuals(model)
plot(model)
 
predict(model, new=data.frame(height=77))

#mtcars
head(mtcars)
model2 = lm(mpg~wt + hp + qsec, data=mtcars)
summary(model2)
model3 = lm(mpg~wt, data=mtcars)
summary(model3)
plot(model3)


#summary of Linear regression
#load the data
#missing values
#correlation between independent variables
#form linear model
#check for model summary - F stats, r2, Coeff P value
#check for assumptions
#predict & find accuracy

