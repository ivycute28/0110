dat1 = read.csv("data2_1.csv", header = TRUE, fileEncoding = 'CP950')
dat1.clean = dat1[duplicated(dat1) == FALSE,]
dat1.clean