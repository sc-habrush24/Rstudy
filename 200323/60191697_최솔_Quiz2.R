library(ggplot2)
midwest=as.data.frame(ggplot2::midwest)
midwest$pasian = midwest$popasian/midwest$poptotal
m1 = mean(midwest$pasian)
midwest$test=ifelse(midwest$pasian > m1, "large", "small")
table(midwest$test)
# large 119 small 318