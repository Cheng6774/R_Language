# 9.1   	示例：将matrix转化成realRatingMatrix，并将realRatingMatrix转化成list和data.frame。
# realRatingMatrix格式转换
library(recommenderlab)
m <- matrix(sample(c(NA, 0:5), 100, replace = TRUE, prob = c(.7, rep(.3/6, 6))), 
            nrow = 10, ncol = 10, dimnames = list(
              user = paste('u', 1:10, sep = ''), 
              item = paste('i', 1:10, sep = '')    
            ))
r <- as(m, "realRatingMatrix")  # 将matrix格式转换成realRatingMatrix格式
r
list.m <- as(r, "list")  # 把realRatingMatrix转化成list
df.m <- as(r, "data.frame")  # 把realRatingMatrix转化成data.frame



# 9.1    示例：根据用户对电影的评分进行电影推荐和电影评分预测
# recommender推荐
library(recommenderlab)
library(ggplot2)
data(MovieLense)  # 电影评分数据
as(MovieLense, "matrix")[1:3, 1:4]  # 显示部分电影评分

# 利用前940位用户建立基于物品的协同过滤推荐模型，method = "IBCF"
m.recomm <- Recommender(MovieLense[1:940], method = "IBCF")
m.recomm

# 对后三位用户进行推荐预测，使用predict()函数，默认是topN推荐
(ml.predict <- predict(m.recomm, MovieLense[941:943], n = 3))  # n = 3 表示Top3推荐
as(ml.predict, "list")  # 电影推荐预测结果

# 用户对item的评分预测，使用predict()函数，type = "ratings"
ml.predict2 <- predict(m.recomm, MovieLense[941:943], type = "ratings")  
as(ml.predict2, "matrix")[1:3, 1:4]  # 显示部分电影评分预测结果



# 9.2  示例：建立基于流行度、基于用户的协同过滤和基于物品的协同过滤推荐模型，并对这三个模型进行评价
# 推荐模型评价
library(recommenderlab)
data(MovieLense)

# 建立评价方案
# 使用evaluationScheme函数将MovieLense分成训练集和测试集
scheme <- evaluationScheme(MovieLense, method = "split", train = 0.9, k = 1, 
                           given = 10, goodRating = 4)
# 设置模型popular，ubcf，ibcf的参数
algorithms <- list(popular = list(name = "POPULAR", param = list(normalize = "Z-score")), 
                   ubcf = list(name = "UBCF", param = list(normalize = "Z-score", 
                                                           method = "Cosine", nn = 25, 
                                                           minRating = 3)), 
                   ibcf = list(name = "IBCF", param = list(normalize = "Z-score")))
# 对模型进行评价
results <- evaluate(scheme, algorithms, n = c(1, 3, 5, 10, 15, 20))

# 输出ROC曲线和precision-recall曲线
plot(results, annotate = 1:3, legend = "topleft")  # ROC
plot(results, "prec/rec", annotate = 3)  # precision-recall

# 按照评价方案建立推荐模型
model.popular <- Recommender(getData(scheme, "train"), method = "POPULAR", 
                             parameter = algorithms[[1]][[2]])
model.ibcf <- Recommender(getData(scheme, "train"), method = "UBCF",
                          parameter = algorithms[[2]][[2]])
model.ubcf <- Recommender(getData(scheme, "train"), method = "IBCF", 
                          parameter = algorithms[[3]][[2]])

# 对推荐模型进行预测
predict.popular <- predict(model.popular, getData(scheme, "known"), type = "ratings")
predict.ubcf <- predict(model.ubcf, getData(scheme, "known"), type = "ratings")
predict.ibcf <- predict(model.ibcf, getData(scheme, "known"), type = "ratings")

#  做误差的计算
# calcPredictionAccuracy()的参数"know "和"unknow "表示对测试集的进一步划分：
# "know "表示用户已经评分的，要用来预测的items；"unknow "表示用户已经评分，要被预测以便于进行模型评价的items。
predict.err <- rbind(calcPredictionAccuracy(predict.popular, getData(scheme, "unknown")), 
                     calcPredictionAccuracy(predict.ubcf, getData(scheme, "unknown")), 
                     calcPredictionAccuracy(predict.ibcf, getData(scheme, "unknown")))
rownames(predict.err) <- c("POPULAR", "UBCF", "IBCF")
predict.err
