stack = function() {
  s = c()
  s_size=0
  push = function(data) {
    if (s_size>=20) {stop("This stack is already full")}
    s <<- c(s,data)
    s_size <<- s_size+1
  
  }
  pop = function() {
    if (s_size==0) {stop("This stack is already empty")}
    last=s[s_size]
    s <<- s[-s_size]
    s_size <<- s_size - 1
    print(last)
    }
  size = function() {
    return(s_size)
  }
  empty = function() {
    if (s_size==0) {return(TRUE)}
    else {return(FALSE)}
  }
  full = function() {
    if (s_size==20) {return(TRUE)}
    else {return(FALSE)}
  }
  return(list(push=push,pop=pop,size=size,empty=empty,full=full))
}
