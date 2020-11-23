#Association Rules in R

course_df <- read.csv('Coursetopics.csv')
str(course_df)

course_df$Intro <- as.factor(course_df$Intro)
course_df$DataMining <- as.factor(course_df$DataMining)
course_df$Survey <- as.factor(course_df$Survey)
course_df$Cat.Data <- as.factor(course_df$Cat.Data)
course_df$Regression <- as.factor(course_df$Regression)
course_df$Forecast <- as.factor(course_df$Forecast)
course_df$DOE <- as.factor(course_df$DOE)
course_df$SW <- as.factor(course_df$SW)

str(course_df)

install.packages("plyr", dependencies= TRUE)
library(plyr)
install.packages("arules", dependencies=TRUE)
library(arules)

rules <- apriori(course_df)

library(arulesViz)
plot(rules)
plot(rules, method = "grouped", control = list(k = 5))
plot(rules, method="graph", control=list(type="items"))
plot(rules,measure=c("support","lift"),shading="confidence",interactive=T)

rules_sorted <- sort (rules, by="confidence", decreasing=TRUE)
inspect(head(rules_sorted, 10)) 

sample_rules <- inspect(sample(rules,10))
write.csv(sample_rules,"sample_rules.csv", row.names = TRUE)
