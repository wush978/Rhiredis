#'@title Append one or multiple values to a list
#'@export
redisRPush <- function( key,  value, Rc = NULL) {
	if (is.null(Rc)) Rc <- getOption("Rhiredis.connect")
	cmd <- "RPUSH"
	redisCommand(Rc, cmd, list(key, value))
}
