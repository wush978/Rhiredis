#'@title Return the number of keys in the selected database
#'@export
redisDBSIZE <- function(Rc) {
	cmd <- sprintf("DBSIZE ")
	redisCommand(cmd, Rc)
}