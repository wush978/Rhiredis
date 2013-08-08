#'@title Set the string value of a key
#'@export
redisSet <- function( key,  value, Rc = NULL) {
	if (is.null(Rc)) Rc <- getOption("Rhiredis.connect")
	cmd <- "SET"
	redisCommand(Rc, cmd, list(key, value))
}
