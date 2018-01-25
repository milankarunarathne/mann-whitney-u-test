data = c("/home/milan/twice_min/1/jtls/twice_min_1.csv", "/home/milan/twice_min/6/jtls/twice_min_6.csv")
# data = c("/home/milan/twice_max/1/twice_max_1/twice_max_1.csv", "/home/milan/twice_max/6/twice_max_6/twice_max_6.csv")
summary_csv = "summary.csv" # summary csv location
result_current = cbind("First CSV","Second CSV","X","Y","W Value","P Value")
print(result_current)
write.table(result_current, file = summary_csv, col.names = FALSE, row.names = FALSE, sep = ",")
# write.csv(data, file = summary_csv, sep = ",", append = TRUE, quote = TRUE, eol = "\n")
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
    if(i==j){
      print(data[j])
      print("read Current csv")
      print("Master csv = Current csv")
      dataC <- dataM
      print("please wait, wilcox test")
      result <- wilcox.test(dataM,dataC, correct = FALSE)
      # write.csv(i, file = summary_csv, append = TRUE, sep = ",")
      print(result)
      result_current <- cbind(data[i], data[j],i,j,result$statistic,result$p.value)
      print(result_current)
      write.table(result_current, file = summary_csv, col.names = FALSE, row.names = FALSE, sep = ",", append = TRUE)
      # print(result)
    }else{
      print(data[j])
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
      result_current <- cbind(data[i], data[j],i,j,result$statistic,result$p.value)
      print(result_current)
      write.table(result_current, file = summary_csv, col.names = FALSE, row.names = FALSE, sep = ",", append = TRUE)
      # write.csv(i, file = summary_csv, append = TRUE, sep = ",", eol = "")
      # write.csv(result, file = summary_csv, append = TRUE, sep = ",", eol = "\n")
      # print(result)
    }
    print("remove Current object and gc")
    rm(dataC)
    gc()
  }
  print("remove Master object and gc")
  rm(dataM)
  gc()
}