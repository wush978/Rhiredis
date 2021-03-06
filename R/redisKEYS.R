#'@title Find all keys matching the given pattern
#'@export
redisKeys <- function( pattern, Rc = NULL) {
	if (is.null(Rc)) Rc <- getOption("Rhiredis.connect")
	cmd <- "KEYS"
	redisCommand(Rc, cmd, list(pattern))
}
