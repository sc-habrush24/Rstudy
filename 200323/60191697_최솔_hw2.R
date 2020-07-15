library(dplyr)
library(ggplot2)

#Q1
mpg=as.data.frame(ggplot2::mpg) 
mean(subset(mpg, displ >= 5)$hwy)
mean(subset(mpg, displ <= 4)$hwy)
#displ 5 이상 hwy의 평균 18.07895이고, 
#displ 4 이하 hwy의 평균25.96319 이기에, 
#displ이 4 이하가 5 이상인 것보다 평균적으로 hwy가 더 높다.

#Q2
mean(subset(mpg, manufacturer=="audi")$cty)
mean(subset(mpg, manufacturer=="toyota")$cty)
#manufacturer이 audi인 것의 cty가 평균 17.61111, 
#manufacturer이 toyota인 것의 cty가 평균 18.52941로,
#toyota가 audi보다 cty가 평균적으로 더 높다.

#Q3
mpg %>% arrange(desc((mpg$hwy+mpg$cty)/2)) %>% head(1)
#new beetle 이 평균 연비가 39.5로 가장 높다