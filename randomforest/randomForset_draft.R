library(party)
print(head(readingSkills))
output.forest <- randomForest(nativeSpeaker ~ age + shoeSize + score, data = readingSkills)

# View the forest results.
print(output.forest) 

# Importance of each predictor.
print(importance(output.forest,type = 2))


library(readr)
library(randomForest)
total_d <- read_csv("total_d.csv")
output.forest <- randomForest(original_c ~ B12+B13+B15+B19+B20+B21+B22+B23+B25+B29,data = total_d,importance=TRUE,ntree=1000)
print(output.forest)
print(importance(output.forest))

