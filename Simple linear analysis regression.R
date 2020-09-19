# Simple linear regression

# input data (or we can use csv)
x=c(45,68,56,78,70,85,90,58,86,75,80,64)
y=c(60,72,66,80,78,90,90,68,94,82,86,72)

# To know the length of x & y
length(x)
length(y)

# Make the plot
plot(x,y)

# add regression line
abline(lm(y~x))

# equation model of regression 
reg1 <- lm(y~x)
reg1

#for more detail, use summary()
summary(reg1)

# analysis residual (Residual vs. Fitted; Normal QQ-Plot; Scale Location; Cook's Distance)
par(mfrow=c(2,2))
plot(reg1)