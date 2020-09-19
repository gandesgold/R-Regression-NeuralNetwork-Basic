library(mlbench)
library(caret)
library(nnet)

# Data Boston Housing
data(BostonHousing)

# check range of medv (for scaling)
summary(BostonHousing$medv)

# Data partition training+testing
inTrain <- createDataPartition(BostonHousing$medv, p = 0.75, list=FALSE)
train.set <- BostonHousing[inTrain,]
test.set <- BostonHousing[-inTrain,]

# Build the model
netmodel <- nnet(medv/50~., size=5, data=train.set, maxit=500)

#  Testing model
medv.predict <- predict(netmodel,test.set[,-14])*50

# Counting Mean Squared Error
mean((medv.predict - test.set$medv)^2)

# plotting chart
plot(test.set$medv, medv.predict, main="Neural Network Prediction Actual", xlab="Actual")

abline(lm(medv.predict~test.set$medv),col="red")