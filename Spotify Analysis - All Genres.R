library(rpart)
library(rpart.plot)
library(randomForest)
library(readr)
source('/Users/jacobnyamu/Desktop/Fall 2022/Machine Learning /Data/BabsonAnalytics.r')

#Loading the data set
df= read.csv("/Users/jacobnyamu/Desktop/Fall 2022/Machine Learning /Spotify/genres_v2.csv")

#Data Management
df$type = NULL
df$id = NULL
df$uri = NULL  
df$track_href = NULL
df$analysis_url = NULL
df$Unnamed..0 = NULL
df$title = NULL 
df$song_name = NULL
df$genre = as.factor(df$genre)
df$genre
sum(is.na(df))

#Partitioning the data set 
N = nrow(df)
trainingSize  = round(N*0.6)
trainingCases = sample(N, trainingSize)
training  = df[trainingCases,]
test      = df[-trainingCases,]

#Building a random forest model 
rf = randomForest(genre ~ ., data= training, ntree=500, importance = TRUE)
print(rf)

importance(rf)
varImpPlot(rf)

#Building a classification tree model with default stopping rules
model = rpart(genre ~ ., data=training)
rpart.plot(model)
pred = predict(model, test, type="class")

errorRate = sum(pred!=test$genre)/nrow(test)
errorBench = benchmarkErrorRate(training$genre,test$genre)

#Building a tree with stopping rules 2000, 1000 and 0
stoppingRules = rpart.control(minsplit=2000,minbucket=1000, cp=0)
model = rpart(genre ~ ., data=training, control=stoppingRules)
rpart.plot(model)
pruned = easyPrune(model)
rpart.plot(pruned)
pred = predict(pruned, test, type="class")
errorRatePruned = sum(pred !=test$genre)/nrow(test)







