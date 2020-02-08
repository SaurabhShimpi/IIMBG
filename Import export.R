#Create a excel file with data in 2 sheets
# first row contains variable names
#C:\Program Files\Java\jre1.8.0_221
Sys.setenv(JAVA_HOME='C:\\Program Files\\Java\\jre1.8.0_221')
library(rJava)
library(xlsx)
write.xlsx2(mtcars, file='./data/iimS.xlsx', sheetName = 'mtcars1', row.names=F, append=T)

write.xlsx2(mtcars, file='./data/mtcars.xlsx', sheetName = 'mtcars1', row.names=F, append=T)
df_excel1 = read.xlsx( "./data/iimS.xlsx", 1)
df_excel1

write.xlsx2(iris, file='./data/mtcars.xlsx', sheetName = 'iris1', row.names=F, append=T)
df_excel2 = read.xlsx( "./data/mtcars.xlsx", 2)
df_excel2

write.xlsx2(iris, file='./data/mtcars.xlsx', sheetName = 'iris2', row.names=F, append=T)
df_excel2b = read.xlsx( "./data/mtcars.xlsx", 'iris2')
df_excel2b
#see the excel sheet in data folder: windows explorer