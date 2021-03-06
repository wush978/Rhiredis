#'@title Get the value of a hash field
#'@export
redisHGet <- function( key,  field, Rc = NULL) {
	if (is.null(Rc)) Rc <- getOption("Rhiredis.connect")
	cmd <- "HGET"
	redisCommand(Rc, cmd, list(key, field))
}
