#'@title Get all the members in a set
#'@export
redisSMembers <- function( key, Rc = NULL) {
	if (is.null(Rc)) Rc <- getOption("Rhiredis.connect")
	cmd <- "SMEMBERS"
	redisCommand(Rc, cmd, list(key))
}
