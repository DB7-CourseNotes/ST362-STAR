library(ISLR2)
data(Hitters)

set.seed(57362)

n <- 600
all_data <- with(Hitters, data.frame(
    AtBat = sample(AtBat, n, TRUE)
))
for(col in colnames(Hitters[, -1])) {
    all_data[, col] <- sample(Hitters[, col], n, TRUE)
}

splitter <- sample(0:10, n, TRUE)

for(i in 0:10) {
    write.csv(all_data[splitter == i, ],
        file = paste0("data/Hitters_", i, ".csv"),
        row.names = FALSE)
}
