library(corrgram)
library(corrplot)
library(MASS)

air = airquality

air1 <- air[complete.cases(air),]
#결측치 제거

air1$Day <- as.factor(air1$Day)
air1$Month <- as.factor(air1$Month)
#factor 설정

air1$Ozone <- (air1$Ozone)^(1/3)
names(air1)[1]<-c("Ozone.sqrt")
#Ozone의 세제곱근을 Ozone으로 바꿈

apply(air1[,1:4],2,shapiro.test)
#Solar만 정규 분포 만족 안함

library(rcompanion)
t.solar <- transformTukey(air1$Solar.R)
#transformTukey를 이용해 
#Solar.R이 정규분포를 만족하지 않음을 확인

x = 1
y = 1
ans = c()
while(x < 5) {
  while(y < 5) {
    c.p = cor(air1[,x],air1[,y],method="pearson")
    c.s = cor(air1[,x],air1[,y],method="spearman")
    c.k = cor(air1[,x],air1[,y],method="kendall")
    ans <- append(ans,min(c.p,c.s,c.k))
    y = y+1
  }
  y=1
  x= x+ 1
}
ans <- matrix(ans,nrow=4,dimnames = list(c("Ozone.sqrt","Solar.R","Wind",
                                           "Temp"),c("Ozone.sqrt","Solar.R",
                                                     "Wind","Temp")))
ans

#세가지 방법으로 상관계수를 구한 뒤, 가장 작은 상관 계수를 택해,
#이를 matrix로 만든다. 

air2 = round(ans,2)
corrplot(air2,method="number")

ggplot(data=air1,aes(x=Ozone.sqrt,y=Solar.R,colour=Month))+geom_point()

ggplot(data=air1,aes(x=Ozone.sqrt,y=Wind,colour=Month))+geom_point()

ggplot(data=air1,aes(x=Ozone.sqrt,y=Temp,colour=Month))+geom_point()

ggplot(data=air1,aes(x=Solar.R,y=Wind,colour=Month))+geom_point()

ggplot(data=air1,aes(x=Solar.R,y=Temp,colour=Month))+geom_point()

ggplot(data=air1,aes(x=Temp,y=Wind,colour=Month))+geom_point()
