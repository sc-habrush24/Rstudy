library(car)

warp=warpbreaks

##Q1
a = warp$breaks[warp$wool=="A"]
b = warp$breaks[warp$wool=="B"]
shapiro.test(a)
shapiro.test(b)
var.test(breaks~wool,warp)
wilcox.test(breaks~wool,data = warp, exact=F,correct=F)
#p-value가 0.2495로 0.05보다 크므로 
#breaks 평균은 울의 종류와 관련이 없다. 

##Q2
shapiro.test(warp$breaks[warp$tension=="L"])
shapiro.test(warp$breaks[warp$tension=="M"])
shapiro.test(warp$breaks[warp$tension=="H"])
leveneTest(breaks~tension,data=warp)
res.aov = aov(breaks~tension,data=warp)
summary(res.aov)
TukeyHSD(res.aov)
#tension이 M인 것과 L 인 것, 그리고 H인 것과 L인 것이
#p-value가 0.05보다 작으므로 breaks 평균에 차이가 있다. 
