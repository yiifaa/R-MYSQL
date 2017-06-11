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
# 关闭数据库链接
dbDisconnect(conn)

