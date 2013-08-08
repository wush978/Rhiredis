#'@title Subtract multiple sets
#'@export
redisSDiff <- function( key, Rc = NULL) {
	if (is.null(Rc)) Rc <- getOption("Rhiredis.connect")
	cmd <- "SDIFF"
	redisCommand(Rc, cmd, list(key))
}
