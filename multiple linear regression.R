# Multiple linear regression

# input data (or we can use csv)
x1=c(45,68,56,78,70,85,90,58,86,75,80,64)
x2=c(58,70,68,75,76,84,92,63,90,80,86,68)
y=c(60,72,66,80,78,90,90,68,94,82,86,72)

mat_UAS <- as.data.frame(cbind(y,x1,x2))

# simple linear regression
reg2 <- lm(y~x1+x2, data = mat_UAS)
summary(reg2)

# 1. Linearity Assumption
library(car)
#component + residual plot
crPlots(reg2)
# ceres plot
ceresPlots(reg2)

# 2. Homoscedacity Assumption
# Breusch Pagan Test
ncvTest(reg2, ~x1+x2)

library(lmtest)
bptest(reg2, studentize=FALSE)

# 3. Multicollinearity Assumption
cor(x1,x2)
vif(reg2)

#4. Normality Assumption
ks.test(reg2$residuals, "pnorm")
