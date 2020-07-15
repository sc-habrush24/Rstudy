###1-(1)
height = c(58:72)
weight = c(115, 117,120, 123,126,129, 132, 135, 139, 142, 146, 150, 154, 159, 164)
cor(height, weight)
## 상관 계수가 0.9954948로, height와 weight 는 관련이 있다. 

###1-(2)
m = lm(weight~height)
summary(m)
## 도출한 식은 다음과weight = -87.51667 + 3.45000*height

###1-(3)
plot(height, weight)
abline(m)
summary(m)
r = residuals(m)
plot(r)
weight[15]
height[15]
## 예측된 수치와 가장 차이가 많이 나는 데이터는 3.1167 만큼 차이가 나고,
## Residuals를 이용해 생성한 그래프를 통해 
## weight = 164, height = 72인 15번째 데이터임을 알 수 있다. 

###1-(4)
plot(m)
weight_c = weight[2:14]
height_c = height[2:14]
m_c = lm(weight~height)
summary(m_c)
## plot(m)을 이용해 이상치인 1번과 15번 데이터를 제거하여
## 선형회귀 모델을 다시 만들어 나오는 formula는 하단과 같다.
## weight = -86.19231 + 3.42308*height

###1-(5)
summary(m)
summary(m_c)

## (2)에서 도출한 선형 회귀 모델은 
##추적 회귀선이 관측값을 약 99.03% 설명할 수 있고
## (4)에서 도출한 선형 회귀 모델은
## 추적 회귀선이 관측값을 약 99.38% 설명할 수 있다.
## 그리고 둘다 F-static이 0.05보다 작으므로
## weight의 coefficient가 통계적으로 유의미함을 알 수 있다.

