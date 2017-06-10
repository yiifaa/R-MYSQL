addProp <- function(i) {
  # 环境变量提权
  if(!exists(x)) {
    x <<- i
  }
}
#
addProp(4)
result <- (function(y) {
  x + y + 1
})(5)
#
print(result)