fibolist=function (size) {
  if (size<=2){
    stop("The size should be greater than 2")
  }
  num1=1
  num2=1
  fibonacci = c(num1,num2)
  count=2
  repeat {
    num3 = num1+num2
    fibonacci = append(fibonacci,c(num3))
    num1 = num2
    num2 = num3
    count=count+1
    if(count>=size) break
  }
  print(fibonacci)
}
