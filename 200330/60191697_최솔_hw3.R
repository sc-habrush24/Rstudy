library(reshape)
library(dplyr)
getwd()
welfare = read.csv("welfare.csv")
head(welfare)

#Q1
welfare$gender=ifelse(welfare$gender==1,"male","female")

#Q2
replace(welfare$income,welfare$income==9999,NA)->welfare$income
replace(welfare$income,welfare$income==0,NA)->welfare$income

#Q3
gender_income=welfare %>%group_by(gender) %>% summarise(mean_income=mean(income,na.rm=T))

#Q4
ggplot(data=gender_income, aes(x=gender, y=mean_income))+geom_bar(stat="identity")
