#'@title Add one or more members to a set
#'@export
redisSAdd <- function( key,  member, Rc = NULL) {
	if (is.null(Rc)) Rc <- getOption("Rhiredis.connect")
	cmd <- "SADD"
	redisCommand(Rc, cmd, list(key, member))
}
