library(reshape)
library(dplyr)
library(ggplot2)
getwd()
welfare = read.csv("welfare.csv")
head(welfare)

#Q1
welfare$gender=ifelse(welfare$gender==1,"male","female")


#Q2
replace(welfare$income,welfare$income==9999,NA)->welfare$income
replace(welfare$income,welfare$income==0,NA)->welfare$income

#Q3
welfare$age = 2020-welfare$birth

#Q4
age_gender_income = welfare %>% filter(!is.na(income)) %>% group_by(gender,age) %>% summarise(mean_income=mean(income))

#Q5
ggplot(data=age_gender_income,aes(x=age,y=mean_income,col=gender)) + geom_line()
