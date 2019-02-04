# install.packages("lavaan")
library(lavaan)
library(semPlot)
model<-'a1=~Q12+Q13+Q20
        a2=~Q14+Q15+Q19+Q25
        a3=~Q21+Q22+Q23+Q29'
fit <- cfa(model, data = total_data)
summary(fit, fit.measures=TRUE)

model<-'a1=~Q12+Q13+Q20
        a2=~Q14+Q15+Q19+Q25
        a3=~Q21+Q22+Q23+Q29'
fit <- sem(model, data = total_data)
summary(fit, standardized = TRUE)
semPaths(fit)
semPaths(fit,what = "est")
semPaths(fit,what = "stand")
semPaths(fit,layout = "tree2")
semPaths(fit,layout = "circle")
semPaths(fit,layout = "circle2")
semPaths(fit,layout = "spring")