breast = read.table("breast.txt",sep=",",header=F,na.string="?")
names(breast) <- c("ID", "clumpThickness","sizeUniformity",
                   "shapeUniformity","maginalAdhension",
                   "sizeSingleEpithelian","bareNuclei",
                   "blandChromatin","normalNucleoli","mitosis","class")
df = breast[-1]
df$class = factor(df$class,levels=c(2,4),labels=c("benign","malignant"))

set.seed(1234)
train = sample(nrow(df),0.7*nrow(df))
df.train = df[train,]
df.test = df[-train,]

#cart
library(rpart)
library(rpart.plot)
set.seed(1234)
dtree = rpart(class~.,data = df.train,method="class",
              parms = list(split="information"))
prp(dtree, type = 2, extra=2, fallen.leaves = T, main="Decision 
    Tree")
dtree.pred = predict(dtree,df.test,type="class")
dtree.perf = table(df.test$class,dtree.pred)
dtree.perf


#conditional inference tree
install.packages("party")
library(party)
set.seed(1234)
fit.ctree = ctree(class~.,data = df.train)
ctree.pred = predict(fit.ctree, df.test, type="response")
ctree.perf=table(df.test$class, ctree.pred)
ctree.perf

#random forest
install.packages("randomForest")
library(randomForest)
set.seed(1234)
fit.forest=randomForest(class~., data=df.train,na.action = na.roughfix,
                        importance=T)
importance(fit.forest,type = 2)
forest.pred = predict(fit.forest,df.test)
forest.perf=table(df.test$class,forest.pred)
forest.perf


#logistic regression
df.train = subset(breast,class==2|class==4)
df.train$class =factor(df.train$class)
m = glm(class~.,data=df.train,na.action = na.roughfix,
        family="binomial")
f = fitted(m)
is_correct = (c(ifelse(f>.5,1,0)) == c(as.numeric(d$class)-1))
sum(is_correct)/NROW(is_correct)

#logistic regression이 가장 좋은 결과를 보인다. 
