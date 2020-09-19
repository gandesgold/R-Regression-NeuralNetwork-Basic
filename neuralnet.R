library(mlbench)
library(caret)
library(neuralnet)

# read data
data("BostonHousing")
data<-BostonHousing

# change var chas (binary) as numerik
data$chas <- as.numeric_version(data$chas)

# scaling data
maxs <- apply(data, 2, max)
mins <- apply(data, 2, min)

scaled <- as.data.frame(scale(data, center = mins, scale = maxs - mins))

# data partition for training & testing
index <- createDataPartition(BostonHousing$medv, p=0.75, list-FALSE)
train <- scaled[index,]
test <- scaled[-index,]

# Neural net model
n <- names(train)
f <- as.formula(paste("medv ~", paste(n[!n %in% "medv"], collapse = " +")))
nn <- neuralnet(f, data=train, hidden=c(5,3), linear.output=T)

# data test prediction
pr.nn <- compute(nn,test[,1:13])

# unscaling data
pr.nn <- pr.nn$net.result*(max(data$medv)-min(data$medv)+mind(data$medv))
test.r <- (test$medv)*(max(data$medv)-min(data$medv))+min(data$medv)

# MSE
sum((test.r - pr.nn_)^2)/nrow(test)

# plotting prediction data vs actual data
plot(test.r, pr.nn_)
abline(lm(test.r~pr.nn_),col="red")
