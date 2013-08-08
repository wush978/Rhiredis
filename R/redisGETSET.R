#'@title Set the string value of a key and return its old value
#'@export
redisGetSet <- function( key,  value, Rc = NULL) {
	if (is.null(Rc)) Rc <- getOption("Rhiredis.connect")
	cmd <- "GETSET"
	redisCommand(Rc, cmd, list(key, value))
}
