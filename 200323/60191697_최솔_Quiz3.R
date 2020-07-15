url = "https://vincentarelbundock.github.io/Rdatasets/csv/boot/coal.csv"
mycoal = read.csv(url)
head(mycoal$date)
mycoal$year=floor(mycoal$date)
mycoal$day=floor((mycoal$date-mycoal$year)*365)
head(mycoal)