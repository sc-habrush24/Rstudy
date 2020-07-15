install.packages("foregin")
install.packages("readxl")
library(foreign)
library(dplyr)
library(ggplot2)
library(readxl)

raw_welfare = read.spss(file = "koweps_hpwc14_2019_beta1.sav",
                        to.data.frame=T)
welfare = raw_welfare
welfare=rename(welfare,
        gender=h14_g3,
        birth=h14_g4,
        marriage=h14_g10,
        religion=h14_g11,
        income=p1402_8aq1,
        job_code = h14_eco9,
        code_region = h14_reg7)

welfare = select(welfare, gender, birth, marriage,
                 religion, income, job_code, code_region)

welfare = welfare %>% filter(!is.na(income))

#Q1
welfare$gender=ifelse(welfare$gender==1,"male","female")
welfare$age = 2020-welfare$birth

age_gender_income = welfare %>% group_by(gender,age) %>% summarise(mean_income=mean(income))

ggplot(data=age_gender_income,aes(x=age,y=mean_income,col=gender)) + geom_line()

#Q2
list_job=read_excel("Job_Code_2020.xlsx",col_names =T, sheet =4)
list_job$job_code=as.numeric(list_job$job_code)
welfare = left_join(welfare, list_job, id="job_code")
welfare = welfare %>% filter(!is.na(job_code)&!is.na(job_name)) %>% 
  select(job_code, job_name, income) 
top10 = welfare %>% select(income,job_name) %>% group_by(job_name) %>% 
  summarise(mean_income=mean(income)) %>% arrange(desc(mean_income)) %>% head(10)

bottom10 = welfare %>% select(income,job_name) %>% group_by(job_name) %>% 
  summarise(mean_income=mean(income)) %>% arrange(mean_income) %>% head(10)

top10_bottom10 = bind_rows(top10, bottom10)
ggplot(data=top10_bottom10, aes(x=reorder(job_name, -mean_income),
                                y=mean_income)) + geom_col() + coord_flip()
