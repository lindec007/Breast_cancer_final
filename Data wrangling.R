#First load library needed
library(dplyr)

#Create new df with the selected variables
BC <- dplyr:: select(breast_cancer, c(diagnosis,area_mean, smoothness_mean, compactness_mean, symmetry_mean))
BC

#Recode the categorical data to numerical data
BC$diagnosis[BC$diagnosis == "M"] <- "1"
BC$diagnosis[BC$diagnosis == "B"] <- "2"

breast_cancer$diagnosis[breast_cancer$diagnosis == "M"] <- "1"
breast_cancer$diagnosis[breast_cancer$diagnosis == "B"] <- "2"

#Modeling using stepwise regression
fitall = lm(diagnosis ~ ., data = BC)
formula(fitall)
summary(fitall)

fitstart = lm(diagnosis ~ 1, data = BC)
head(BC)

step(fitstart, direction = "both", scope = formula(fitall))

