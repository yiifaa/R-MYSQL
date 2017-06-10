add <- function(v1, num=10) {
  args <- as.list(match.call())
  # 得到参数对象
  print(args$v1)
  return (v1 + num)
}
addAll <- function(v1, ...) {
  # args <- as.list(...)只取第一个元素，结果为
  #
  args <- list(...)
  for(num in args) {
    v1 <- v1 + num  
  }
  v1
}

v1 <- c(1, 2, 3)
v2 <- add(v1)
#  输出结果
print(v2)
#
vr <- add(v1, 20)
print(vr)
##
sum <- addAll(1, 2, 3, 4, 5)
print(sum)
##
vr <- sapply(v1, add)
vr
##
three.call <- function(fn) {
  fn(3)
}
result = three.call(function(x) {
  x * 7
}) 
