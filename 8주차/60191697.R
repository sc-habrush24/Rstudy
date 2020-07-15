library(propagate)
set.seed(275)
library(MASS)
library(dplyr)

###1-1
Blue_eyes = c(24, 14)
Brown_eyes = c(11, 47)
table1 = cbind(Blue_eyes, Brown_eyes)
rownames(table1) <-c("Blond_hair", "Dark_brown_hair")
table1


###1-2
shapiro.test(table1)
chisq.test(table1)
##p-value가 2.882e-05 로 0.05보다 작으므로 대립 가설을 채택한다. 
##고로, 눈 색깔과 머리카락 색깔은 독립이 아니다. 

###2-1
x = c(70,80,72,76,76,76,72,78,82,64,74,92,74,68,84)
y = c(68,72,62,70,58,66,68,52,64,72,74,60,74,72,74)
sub = as.numeric(x-y)
table2 = rbind(x,y,sub)
colnames(table2)
table2
 
###2-2
shapiro.test(x)
shapiro.test(y)
var.test(x,y)
t.test(x,y,paired=FALSE,var.equal = T)
##p-value 가 0.001346로 0.05보다 작으므로 대립 가설을 채택한다.
##고로, 약은 협압강하 증상의 부작용이 있다. 

###2-3
t.test(x-y,alternative = "greater",mu = 0)
##p-value가 0.003875로 0.05보다 작으므로 대립 가설을 채택한다. 
##고로 환자들 개인이 이 약을 복용함으로써 혈압을 내린다는 주장을
##할 수 없다. 

###3
m = c(57, 78, 42, 44, 91, 65, 63, 60, 97, 85, 92, 42, 86, 81, 64)
f = c(73, 96, 74, 55, 91, 50, 46, 82, 43, 79, 79, 50, 46, 81, 83)
shapiro.test(m)
shapiro.test(f)
var.test(m,f)
t.test(m,f,alternative="greater",paired=FALSE,var.equal = TRUE)

###p-value가0.4262로 0.05보다 크므로 귀무가설을 채택한다.
###남학생과 여학생의 성적이 서로 독립이므로
###이 대학의 데이터테크놀로지 학과에서 남학생이 여학생보다
###R에 대한 지식이 높다고 말할 수 없다. 