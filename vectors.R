#vectors----
x=1
x
print(x)

x1 = 1:10
x1
x2 <- 5
x2 
x3 = c(1,5,7,0,100)
x3
class(x3)
class(x1)

x = rnorm(100,mean=60,sd=15)
hist(x,breaks=c(10,40,80,100))
?hist
plot(density(x)) #normal curve
x[seq(1,100,2)]
plot(x)

#matrices
(data=round(rnorm(24,mean=40, sd=3)))
trunc(34.6)
floor(c(15.4,-15.4))
ceiling(c(15.4,-15.4))
data
(m1 = matrix(data, nrow=4))
(m2 = matrix(data, nrow=4, byrow=T))
colSums(m1)
rowSums(m1)
colMeans(m1)
rowMeans(m1)
m1[,c(1,4)]
m1[c(3,2),c(1,4)]

#dataframe
mtcars
str(mtcars)
summary(mtcars)
df = mtcars
names(df)
df$cyl = factor(df$cyl)
str(df)
df[,c('cyl','vs','am','gear','carb')]=lapply(df[,c('cyl','vs','am','gear','carb')],factor)
str(df)
summary(df)
table(df$cyl)
barplot(table(df$cyl), col =1:3)
barplot(table(df$gear),col=1:3)
pie(table(df$gear),col=1:3)
table(df$gear,df$am, dnn=c('gear','am')) #contingency table
table(df$gear,df$am, df$cyl, dnn=c('gear','am','cyl'))
?aggregate
aggregate(cbind(mpg,wt) ~ cyl, data = df, mean)
aggregate(cbind(mpg,wt) ~ cyl + gear, data = df, mean)
#mean mpg & wt for each gear and cyl type

#factors
#without order
set.seed(1234)
(gender = sample(c('M','F'),size=100000, replace=T, prob=c(0.7,0.3)))
table(gender)
prop.table(table(gender))
barplot(table(gender))
pie(table(gender))

#grades
set.seed(1234)
(grades = sample(c('A','B','C','D'),size=100000, replace=T, prob=c(0.4,0.3,0.2,0.1)))
table(grades)
prop.table(table(grades))
barplot(table(grades))
pie(table(grades))

(grades = sample(c('E','G','S','P'),size=100000, replace=T, prob=c(0.4,0.3,0.2,0.1)))
table(grades)
prop.table(table(grades))
barplot(table(grades))
pie(table(grades))
grades2 = factor(grades, ordered=T, levels=c('E','G','S','P'))
str(grades2)
barplot(table(grades2))


#dplyr----
library(dplyr)
df=mtcars
df[,c('cyl','vs','am','gear','carb')]=lapply(df[,c('cyl','vs','am','gear','carb')],factor)
str(df)
summary(df)

#find mean mpg and wt wrt each gear & cyl type
df %>% group_by(cyl, gear) %>% summarise(meanWT = mean(wt, na.rm=T), meanMPG = mean(mpg, na.rm=T), n())
df %>% filter (mpg>25)
df %>% filter (mpg>25 & gear %in% c(4))

df
#ggplots
ggplot(df, aes(x=wt, y=mpg)) + geom_point()
ggplot(df, aes(x=wt, y=mpg)) + geom_point(aes(color=am))
ggplot(df, aes(x=wt, y=mpg)) + geom_point(aes(color=am, size=hp))
ggplot(df, aes(x=wt, y=mpg)) + geom_point(aes(color=am, size=hp, shape=carb))

df %>% group_by(cyl,gear) %>% summarise(CNT =n())
ggplot(df %>% group_by(cyl,gear) %>% summarise(CNT = n()), aes(x=cyl, y=CNT, fill=gear)) + geom_bar(stat='identity') # stacked bars
ggplot(df %>% group_by(cyl,gear) %>% summarise(CNT = n()), aes(x=cyl, y=CNT, fill=gear)) + geom_bar(stat='identity', position = position_dodge2(.7)) + geom_text(aes(label=CNT), position=position_dodge2((.7)) + facet_grid(carb~am, scale='free')) 

ggplot(df, aes(x='',y='mpg')) + geom_boxplot()
ggplot(df, aes(x=gear,y=mpg,fill=gear)) + geom_boxplot() + facet_grid(am~cyl)
