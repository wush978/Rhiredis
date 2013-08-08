#'@title Get the length of a list
#'@export
redisLLen <- function( key, Rc = NULL) {
	if (is.null(Rc)) Rc <- getOption("Rhiredis.connect")
	cmd <- "LLEN"
	redisCommand(Rc, cmd, list(key))
}
