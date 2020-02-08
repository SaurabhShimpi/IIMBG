library(wordcloud2)
df = data.frame(word=c('imi','iim','imt'), freq=c(20,13,15))
df
par(mar=c(0,0,0,0))
wordcloud2(df)

head(demoFreq)
dim(demoFreq)
par(mar=c(0,0,0,0))
wordcloud2(demoFreq, size =2, color = "random-light", backgroundColor = "white")
demoFreq
