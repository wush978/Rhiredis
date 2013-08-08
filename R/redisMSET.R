#'@title Set multiple keys to multiple values
#'@export
redisMSet <- function( key,  value, Rc = NULL) {
	if (is.null(Rc)) Rc <- getOption("Rhiredis.connect")
	cmd <- "MSET"
	redisCommand(Rc, cmd, list(key, value))
}
