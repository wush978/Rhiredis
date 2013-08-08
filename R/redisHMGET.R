#'@title Get the values of all the given hash fields
#'@export
redisHMGet <- function( key,  field, Rc = NULL) {
	if (is.null(Rc)) Rc <- getOption("Rhiredis.connect")
	cmd <- "HMGET"
	redisCommand(Rc, cmd, list(key, field))
}
