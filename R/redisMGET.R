#'@title Get the values of all the given keys
#'@export
redisMGet <- function( key, Rc = NULL) {
	if (is.null(Rc)) Rc <- getOption("Rhiredis.connect")
	cmd <- "MGET"
	redisCommand(Rc, cmd, list(key))
}
