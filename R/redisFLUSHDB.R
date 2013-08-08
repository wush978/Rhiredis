#'@title Remove all keys from the current database
#'@export
redisFlushDB <- function(Rc = NULL) {
	if (is.null(Rc)) Rc <- getOption("Rhiredis.connect")
	cmd <- "FLUSHDB"
	redisCommand(Rc, cmd)
}
