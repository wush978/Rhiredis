#'@title Add multiple sets
#'@export
redisSUnion <- function( key, Rc = NULL) {
	if (is.null(Rc)) Rc <- getOption("Rhiredis.connect")
	cmd <- "SUNION"
	redisCommand(Rc, cmd, list(key))
}
