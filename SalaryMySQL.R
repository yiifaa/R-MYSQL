# 注意架包大小写
# 首先安装DBI架包
# 然后安装RMySQL架包
# install.packages('DBI')
# install.packages('RMySQL')
# 
drv <- dbDriver('MySQL')
class(drv)
# 创建链接
conn <- dbConnect(drv,
                  user = 'stixu',
                  password = 'stixu',
                  dbname = 'stixu',
                  host = 'localhost',
                  port = 3306)
# 诊断链接信息
class(conn)
#
salarys <- dbGetQuery(conn, 
                      paste('select * from SALARY')
)
# 获取异常
ex <- dbGetException(conn)
print(ex)
# 获取数据的第二种方法
if(ex$errorNum == 0) {
  allQuery <- dbSendQuery(conn,
                          paste('select * from SALARY'))
}
# 抓取数据
results <- fetch(allQuery)
# 输出字段名
names(salarys)
# 输出行数量*列数量
dim(results)
# 对数据进行处理,返回LIST
salarys$SEX <- lapply(salarys$SEX, function(x) switch(x, FEMALE='女', MALE='男'))
# 返回向量
salarys$SEX <- c(salarys$SEX, recursive = TRUE)
# 只选择部分记录，不能省略逗号
salarys.female <- salarys[salarys$ID %% 2 == 0,]
# 按性别分组
salarys.sum <- tapply(salarys$SALARY, INDEX=salarys$SEX, FUN=sum)
salarys.max <- by(salarys[c('SALARY')], INDICES = list(salarys$SEX), FUN=max)
salarys.max <- aggregate(x=salarys[c('SALARY')], by = list(salarys$SEX, salarys$ID), FUN=max)
# 关闭数据库链接
dbDisconnect(conn)

