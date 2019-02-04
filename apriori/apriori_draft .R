library(arules)
total_data=read.transactions("total_data.csv", format =c("basket"), sep =",",cols = 1, rm.duplicates =TRUE, encoding = "UTF-8")
rules=apriori(total_data, parameter=list(support=0.01,confidence=0.1,minlen=2,maxlen=15))
inspect(rules[1:10])
rules_lift=sort(rules,by="lift")
inspect(rules_lift[1:10])

        