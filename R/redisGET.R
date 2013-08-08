#'@title Get the value of a key
#'@export
redisGet <- function( key, Rc = NULL) {
	if (is.null(Rc)) Rc <- getOption("Rhiredis.connect")
	cmd <- "GET"
	redisCommand(Rc, cmd, list(key))
}
