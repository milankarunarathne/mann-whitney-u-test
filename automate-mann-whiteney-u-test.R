data = c("/home/milan/twice_max/1/twice_max_1/twice_max_1.csv", "/home/milan/twice_max/2/twice_max_2/twice_max_2.csv", "/home/milan/twice_max/3/twice_max_3/twice_max_3.csv", "/home/milan/twice_max/4/twice_max_4/twice_max_4.csv", "/home/milan/twice_max/5/twice_max_5/twice_max_5.csv", "/home/milan/twice_max/6/twice_max_6/twice_max_6.csv", "/home/milan/twice_max/7/twice_max_7/twice_max_7.csv", "/home/milan/twice_max/8/twice_max_8/twice_max_8.csv", "/home/milan/twice_max/9/twice_max_9/twice_max_9.csv", "/home/milan/twice_max/10/twice_max_10/twice_max_10.csv")
for(i in 1:length(data)){
  print(data[i])
  print("read Master csv")
  dataM <- read.csv(data[i],header = T) # read csv of the before scenario
  dataM <- data.frame(dataM)
  print("master csv reading completed")
  gc()
  keeps <- c("Latency")
  dataM <- dataM[, keeps, drop=TRUE] # only select values of the "Latency" column
  gc()
  for(j in 1:length(data)){
    print("read Current csv")
    dataC <- read.csv(data[j],header = T) # read csv of the before scenario
    dataC <- data.frame(dataC)
    print("current csv reading completed")
    gc()
    dataC <- dataC[, keeps, drop=TRUE] # only select values of the "Latency" column
    gc()
    print("please wait, wilcox test")
    result <- wilcox.test(dataM,dataC, correct = FALSE)
    print(result)
    print("remove Current object and gc")
    rm(dataC)
    gc()
  }
  print("remove Master object and gc")
  rm(dataM)
  gc()
}
