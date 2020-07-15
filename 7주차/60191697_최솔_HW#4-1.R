library(propagate)
set.seed(275)
library(MASS)
data(survey)

#Q1
HndClap = xtabs(~W.Hnd + Clap, data = survey)
chisq.test(HndClap)
#X-squared = 19.252, df = 2, p-value = 6.598e-05
#p-value 가 0.05보다 작기 때문에 대립 가설을 채택한다. 
#즉, 손글씨를 어느 손으로 쓰는지와 
#박수를 칠 때 어느 손이 위로 가는지는 서로 관계가 있다. 

#Q2
SmokeExer = xtabs(~Smoke + Exer, data = survey)
chisq.test(SmokeExer)

#X-squared = 5.4885, df = 6, p-value = 0.4828
#p-아value 가 0.05보다 크기 때문에 귀무가설을 채택한다.
#즉, 운동과 흡연량은 서로 관계가 없다.   

