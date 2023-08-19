library(e1071)

# Generate some synthetic data
set.seed(123)
x <- seq(0, 5, by = 0.1)
y <- sin(x) + rnorm(length(x), sd = 0.5)

# Put data into a data frame
data <- data.frame(x = x, y = y)

# Train SVR model
model_svm <- svm(y ~ x, data = data, type = "eps-regression", kernel = "radial")

model_lm <- lm(y ~ x+I(x^2)+I(x^3)+I(x^4), data = data)

model_svm

# Predict with the trained model
predictions <- predict(model_svm, data)
predict_lm <- predict(model_lm,data)

# Plot the results
plot(x, y, main="Support Vector vs. Least Squares Regression", col="blue", pch=16)
lines(x, predictions, col="red", lwd=2)
lines(x,predict_lm,col="green",lwd=4)
legend("topright", legend=c("Actual Data", "SVR Prediction","Least Squares"), col=c("blue", "red","green"), lwd=2, pch=16, bty="n")


library(digest)
library(here)
library(rmarkdown)

