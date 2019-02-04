# install.packages("lavaan")
library(lavaan)
library(semPlot)
model<-'a1=~Q12+Q13+Q15+Q20
        a2=~Q29+Q23
        a3=~Q21+Q22
        a4=~Q19
        a5=~Q14
        a6=~Q25'
fit <- cfa(model, data = total_data)
summary(fit, fit.measures=TRUE)

model<-'a1=~Q12+Q13+Q15+Q20
        a2=~Q29+Q23
        a3=~Q21+Q22
        a4=~Q19
        a5=~Q14
        a6=~Q25

        a1~a2
        a2~a3'
fit <- sem(model, data = total_data)
summary(fit, standardized = TRUE)
semPaths(fit)
semPaths(fit,what = "est")
semPaths(fit,what = "stand")
semPaths(fit,layout = "tree2")
semPaths(fit,layout = "circle")
semPaths(fit,layout = "circle2")
semPaths(fit,layout = "spring")