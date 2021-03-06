#'@title Determine if a key exists
#'@export
redisExists <- function( key, Rc = NULL) {
	if (is.null(Rc)) Rc <- getOption("Rhiredis.connect")
	cmd <- "EXISTS"
	redisCommand(Rc, cmd, list(key))
}
