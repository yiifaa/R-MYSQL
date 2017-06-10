setClass("Employee",
         representation (
           age = "numeric",
           username = 'character'
         )
)
##
setValidity('Employee',
            function (params) {
              params@age > 0
            })

#
getUsername <- function(object) {
  return (object@username)
}
setMethod(getUsername, signature = c('Employee'))
#
em <- new('Employee', age = 12, username='Huan')
validObject(em)
username <- getUsername(em)
print(username)


