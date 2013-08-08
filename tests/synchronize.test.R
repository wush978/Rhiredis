library(Rhiredis)

con <- redisConnect()

system.time({
	for(i in 1:100) {
		redisLPUSH("test", "as df")
	}
})
