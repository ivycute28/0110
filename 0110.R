data_pipeline = function (file.path) {
  dat1 = read.csv(file.path, header = TRUE, fileEncoding = 'CP950')
  dat1.clean = dat1[duplicated(dat1) == FALSE,]
  dat1.clean
}

data1_clean <- data_pipeline("data2_1.csv")
head(data1_clean)

data2_clean <- data_pipeline("data2_2.csv")
head(data2_clean)

data1_clean <- data_pipeline("data2_1.csv")
data2_clean <- data_pipeline("data2_2.csv")
merge.dat = merge(data1_clean, data2_clean, by = "school", all = TRUE)
head(merge.dat)

data1_clean <- data_pipeline("data2_1.csv")
data2_clean <- data_pipeline("data2_2.csv")
data1.simple = data1_clean[,c("s_d0", "school")]
data2.simple = data2_clean[,c("s_d0", "school")]
simple.merge.dat = merge(data1.simple, data2.simple, by = "school", all = TRUE)
head(simple.merge.dat)

for (i in 1:2) {
  if (i == 1) {
    data_clean.start = data_pipeline(paste("data2_", i, ".csv", sep = ""))
    data.simple.start = data_clean.start[,c("s_d0", "school")]
  } else {
    data_clean.continue = data_pipeline(paste("data2_", i, ".csv", sep = ""))
    data.simple.continue = data_clean.continue[,c("s_d0", "school")]
    data.simple.start = merge(data.simple.start, data.simple.continue, by = "school", all = TRUE)
  }
}

colnames(data.simple.start) = c('school', paste('s_d0.', 1:2, sep = ""))

head(data.simple.start)