data = c("/home/milan/twice_max/1/twice_max_1/twice_max_1.csv", "/home/milan/twice_max/2/twice_max_2/twice_max_2.csv")
result = data
for(i in 1:length(data)){
  print(data[i])
  dataM <- read.csv(data[i],header = T) # read csv of the before scenario
  dataM <- data.frame(dataM)
  keeps <- c("Latency")
  dataM <- dataM[, keeps, drop=TRUE] # only select values of the "Latency" column
  dataM
  for(j in 1:length(data)){
    print(data[j])
    dataC <- read.csv(data[j],header = T) # read csv of the before scenario
    dataC <- data.frame(dataC)
    dataC <- dataC[, keeps, drop=TRUE] # only select values of the "Latency" column
    dataC
    result <- wilcox.test(dataM,dataC, correct = FALSE)
    print(result)
    print("remove Current object and gc")
    rm(dataC)
    gc(TRUE) 
  }
  print("remove Master object and gc")
  rm(dataM)
  gc(TRUE)
} 
write.csv(result, file = "results.csv")

