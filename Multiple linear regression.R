sales= c(4141,3842,3056,3519,4226, 4630,3507,3754, 5000,5120,4011, 5015,1916,675, 3636,3224,2295, 2730,2618,4421, 4113,3746, 3532, 3825,1096, 761,2088,820,2114, 1882,2159,1602,3354,2927)
price = c(59,59,59,59,59,59,59,59,59,59,59,59, 79,79,79,79,79,79,79,79,79, 79,79,79,99,99, 99,99,99,99,99,99,99,99)
promotion= c(200,200,200,200,400,400,400,400, 600,600,600,600,200,200,200,200, 400,400,400,400,600,600,600,600, 200,200,200,200,400,400,400,400,600,600)
omni1 = data.frame(sales,price,promotion)
head(omni1)
omni = omni1
head(omni)
str(omni)
nrow(omni)
dim(omni)
# we want to see how Sales Qty depend on Price and Promotion Values
fit2 = lm(sales ~ price + promotion, data=omni)
summary(fit2)
names(summary(fit2))
summary(fit2)$adj.r.squared
coef(fit2)
summary(fit2)
range(omni$price) ; range(omni$promotion)
(ndata2 = data.frame(price=c(60,70,72), promotion=c(300,400,350)))
(p2sales = predict(fit2, newdata=ndata2, type='response'))
cbind(ndata2, p2sales)
head(omni)
par(mfrow=c(2,2))
plot(fit2)
par(mfrow=c(1,1))
plot(fit2)
plot(fit2,which=1)  # no pattern, equal variance
plot(fit2,2)  # Residuals are normally distributed
plot(fit2,3)  # No hetero-scedascity
plot(fit2,4)  # tells outliers which affect model
omni[c(11,14,15),]
