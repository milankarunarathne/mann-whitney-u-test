dataRbeforeFile=read.csv("/home/milan/workspace/R/resources/min_degradataion/before.csv",header = T) # read csv of the before scenario
dataRbefore <- data.frame(dataRbeforeFile)
keeps1 <- c("Latency")
dataRbefore = dataRbefore[, keeps1, drop=TRUE] # only select values of the "Latency" column
print(dataRbefore)
hist(dataRbefore, xlab = keeps1, breaks = 100, xlim = c(000,1000))  # adjust scale of the hisogram

dataRafterFile=read.csv("/home/milan/workspace/R/resources/min_degradataion/after.csv",header = T) # read csv of the after scenario
dataRafter <- data.frame(dataRafterFile)
keeps2 <- c("Latency")
dataRafter = dataRafter[, keeps2, drop=TRUE] # only select values of the "Latency" column
print(dataRafter)
hist(dataRafter, xlab = keeps2, breaks = 500, xlim = c(000,1000)) # adjust scale of the hisogram

a = c(dataRbefore)
b = c(dataRafter)

wilcox.test(a,b,correct = FALSE) # wilcoxon test