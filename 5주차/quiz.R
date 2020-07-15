library(ggplot2)
library(dplyr)
mpg=as.data.frame(ggplot2::mpg)
k = boxplot(mpg$hwy~mpg$drv, data=mpg, xlab="",ylab="",col=c("yellow","cyan","green"))
k
