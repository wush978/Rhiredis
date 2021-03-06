#'@title Remove elements from a list
#'@export
redisLRem <- function( key,  count,  value, Rc = NULL) {
	if (is.null(Rc)) Rc <- getOption("Rhiredis.connect")
	cmd <- "LREM"
	redisCommand(Rc, cmd, list(key, count, value))
}
