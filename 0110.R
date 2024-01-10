data_pipeline = function (file.path) {
  dat1 = read.csv(file.path, header = TRUE, fileEncoding = 'CP950')
  dat1.clean = dat1[duplicated(dat1) == FALSE,]
  dat1.clean
}

data1_clean <- data_pipeline("data2_1.csv")
head(data1_clean)