install.packages("ggplot2")
mpg=as.data.frame(ggplot2::mpg)
mpg$total = (mpg$cty+mpg$hwy)/2
m1 = mean(append(mpg$cty,mpg$hwy))
mpg$test=ifelse(mpg$total >= m1, "pass", "fail")
table(mpg$test)
#fail이 111이고 pass가 123으로 고연비 평가를 합격한 차는 123대이다.