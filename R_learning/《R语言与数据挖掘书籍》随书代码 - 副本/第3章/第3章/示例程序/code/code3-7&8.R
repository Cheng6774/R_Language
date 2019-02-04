# 3.7  RWordseg包文本分词
library(rJava)
library(Rwordseg)
# 文本分词
segmentCN("雷克萨斯品牌")  # 对"雷克萨斯品牌"进行分词
insertWords(c("雷克萨斯"))  # 导入词汇
segmentCN("雷克萨斯品牌")  # 导入词汇后再次分词
deleteWords(c("雷克萨斯"))  # 删除词汇
segmentCN("雷克萨斯品牌")   # 删除词汇后再次分词

# 载入词典并进行文本分词
# 词典下载链接：http://pinyin.sogou.com/dict/detail/index/15153
# 加载词典并命名为qiche
installDict(dictpath = ".\\data\\汽车词汇大全.scel", dictname = 'qiche' ) 
listDict()  # 查看词典
segmentCN("雷克萨斯品牌")  # 加载词典后再次分词
uninstallDict()  # 卸载词典



# 3.7    jiebaR包分词代码
# jiebaR包文本分词
library(jiebaR)
# 接受默认参数，建立分词引擎 
mixseg <- worker()  # 默认mix分词引擎
mpseg <- worker(type = "mp")  # mp分词引擎
hmmseg <- worker(type = "hmm")  # hmm分词引擎
word = "人们都说桂林山水甲天下"
# 使用分词运算符进行分词
mixseg <= word  # <= 分词运算符
mpseg <= word
hmmseg <= word
# 使用segment进行分词
segment(word, mixseg)  # 分词结果与分词运算符的结果相同
# 使用qseg进行分词
qseg <= word
qseg[word]
# 对文件进行分词
segment(".\\data.txt", mixseg)
mixseg <= ".\\data.txt"
qseg <= ".\\data.txt"



# 3.7 	示例：获取worker的信息
# 获取worker的信息
# 输出mixseg的设置
mixseg 
# 通过"$"符号改变mixseg的参数
mixseg$symbol <- T  # 在输出中保留标点符号
# 通过mixseg$PrivateVarible获得无法修改的参数信息
mixseg$PrivateVarible



# 3.7	示例：词性标注
# 词性标注
word <- "人们都说桂林山水甲天下"
tagger <- worker("tag")  # 初始化分词引擎，type="tag"
tagger <= word  # 对word进行词性标注
# 使用qseg进行词性标注
qseg$type <- "tag"  # 将分词模式改为"tag"
qseg[word]  # 对word进行词性标注



# 3.7  	示例：关键词提取和Simhash计算
# 关键词提取和Simhash计算
# 初始化分词引擎，type=" keywords "，关键词个数为1
keys <- worker("keywords", topn = 1) 
keys <= word  # 提取word中的关键词
# 初始化分词引擎，type=" simhash "，关键词个数为2
simhash <- worker("simhash", topn = 2) 
simhash <= word 



# 3.8 	示例：计算矩阵x各行各列的均值
# 使用apply函数计算矩阵的均值
x <- matrix(1:20, ncol = 4) 
x
apply(x, 1, mean)  # 计算各行的均值
apply(x, 2, mean)  # 计算各列的均值



# 3.8	示例：对列表x的每一个元素计算均值
# 使用lapply函数计算各子列表的均值
x <- list(a = 1:5,  b = exp(0:3))
lapply(x, mean)  # 对列表x的每一个元素计算均值



# 3.8  	示例：列表list中的元素与数字1-3连接，并以矩阵和列表两种形式输出
# 使用sapply函数处理列表的字符串连接
list <- list(c("a", "b", "c"), c("A", "B", "C"))
list
# 列表list中的元素与数字1-3连接，输出结果为矩阵
sapply(list, paste, 1:3, simplify = TRUE) 
# 列表list中的元素与数字1-3连接，输出结果为列表
sapply(list, paste, 1:3 , simplify = F)



# 3.8  	示例：计算不同sex对应的height的均值
# 使用tapply函数进行分组统计
height <- c(174,  165,  180,  171,  160)
sex <- c("F", "F", "M", "F", "M")
tapply(height,  sex,  mean)  # 计算不同sex对应的height的均值



# 3.8  	示例：使用mapply函数重复生成列表list(x = 1:2))
# 使用mapply函数重复生成列表
# 重复生成列表list(x = 1:2))，重复次数times=1:3，结果为一个列表
mapply(rep, times = 1:3, MoreArgs = list(x = 1:2))
# 重复生成列表list(x = 1:2))，重复次数times=c(2, 2)，结果为一个矩阵
mapply(rep, times = c(2, 2), MoreArgs = list(x = 1:2))

