#'@title Add multiple sets and store the resulting set in a key
#'@export
redisSUnionStore <- function( destination,  key, Rc = NULL) {
	if (is.null(Rc)) Rc <- getOption("Rhiredis.connect")
	cmd <- "SUNIONSTORE"
	redisCommand(Rc, cmd, list(destination, key))
}
