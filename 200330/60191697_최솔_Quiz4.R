library(ggplot2)
library(dplyr)
mpg = as.data.frame(ggplot2::mpg)

#Q1
c_suv = mpg %>% select(class, cty) %>% filter(class=="suv")
mean(c_suv$cty)
c_com = mpg %>% select(class, cty) %>% filter(class=="compact")
mean(c_com$cty)
#suv의 cty 평균은 13.5, compact의 cty 평균은 20.12766으로 
#compact의 도시연비가 더 높다.


#Q2
mpg %>% filter(manufacturer=="audi") %>% arrange(desc(hwy)) %>% head(5)
#  manufacturer      model displ year cyl      trans drv cty hwy fl   class
#1         audi         a4   2.0 2008   4 manual(m6)   f  20  31  p compact
#2         audi         a4   2.0 2008   4   auto(av)   f  21  30  p compact
#3         audi         a4   1.8 1999   4   auto(l5)   f  18  29  p compact
#4         audi         a4   1.8 1999   4 manual(m5)   f  21  29  p compact
#5         audi a4 quattro   2.0 2008   4 manual(m6)   4  20  28  p compact


#Q3
mpg$class=ifelse(mpg$class=="compact", 1, 0)
mpg %>% group_by(manufacturer) %>% summarise(sum_c = sum(class)) %>% arrange(desc(sum_c)) %>% head(3)
#compact 수가 15인 audi가 가장 많은 compact 차종을 생산하고 있다. 