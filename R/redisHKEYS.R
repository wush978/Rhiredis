#'@title Get all the fields in a hash
#'@export
redisHKeys <- function( key, Rc = NULL) {
	if (is.null(Rc)) Rc <- getOption("Rhiredis.connect")
	cmd <- "HKEYS"
	redisCommand(Rc, cmd, list(key))
}
