#'@title Get all the fields and values in a hash
#'@export
redisHGetAll <- function( key, Rc = NULL) {
	if (is.null(Rc)) Rc <- getOption("Rhiredis.connect")
	cmd <- "HGETALL"
	redisCommand(Rc, cmd, list(key))
}
