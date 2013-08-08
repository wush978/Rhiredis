#'@title Move a key to another database
#'@export
redisMove <- function( key,  db, Rc = NULL) {
	if (is.null(Rc)) Rc <- getOption("Rhiredis.connect")
	cmd <- "MOVE"
	redisCommand(Rc, cmd, list(key, db))
}
