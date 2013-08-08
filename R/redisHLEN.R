#'@title Get the number of fields in a hash
#'@export
redisHLen <- function( key, Rc = NULL) {
	if (is.null(Rc)) Rc <- getOption("Rhiredis.connect")
	cmd <- "HLEN"
	redisCommand(Rc, cmd, list(key))
}
