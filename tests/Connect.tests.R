library(Rhiredis)

a <- new(redisContext, "localhost", 6379)
b <- a
b$err
rm(a)
gc()
b$err
b$errstr