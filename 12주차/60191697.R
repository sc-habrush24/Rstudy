ad = read.csv("ad.csv")
set.seed(100)

lmMod1 = lm(sales~TV,data = ad)
lmMod2 = lm(sales~radio,data=ad)
lmMod3 = lm(sales~newspaper,data = ad)
lmMod4 = lm(sales~newspaper * TV * radio,data = ad)
lmMod5 = lm(sales~TV * radio, data = ad)
lmMod6 = lm(sales~TV * newspaper, data = ad)
lmMod7 = lm(sales~newspaper*radio,data=ad)
lmMod8 = lm(sales~(TV+radio+newspaper)^2,data=ad)
lmMod9 = step(lmMod8,direction="backward")

summary(lmMod1)#0.6099
anova(lmMod1)
summary(lmMod2)#0.3287
anova(lmMod2)
summary(lmMod3)#0.04733
anova(lmMod3)
summary(lmMod4)#0.9675
anova(lmMod4)
summary(lmMod5)#0.9673
anova(lmMod5)
summary(lmMod6)#0.6432
anova(lmMod6)
summary(lmMod7)#0.3233
anova(lmMod7)
summary(lmMod8)#0.9677
anova(lmMod8)
summary(lmMod9)#0.9678
anova(lmMod9)

par(mfrow=c(2,2))
plot(lmMod1)
plot(lmMod2)
plot(lmMod3)
plot(lmMod4)
plot(lmMod5)
plot(lmMod6)
plot(lmMod7)
plot(lmMod8)
plot(lmMod9)

trainingRowIndex = sample(1:nrow(ad),0.6*nrow(ad))
trainingData = ad[trainingRowIndex,]
testData = ad[-trainingRowIndex,]

lmMod = lmMod9
distPred = predict(lmMod, testData)
actuals_preds=data.frame(cbind(actuals = testData$sales,predict = distPred))
cor(actuals_preds)
