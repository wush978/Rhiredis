#'@title Intersect multiple sets
#'@export
redisSInter <- function( key, Rc = NULL) {
	if (is.null(Rc)) Rc <- getOption("Rhiredis.connect")
	cmd <- "SINTER"
	redisCommand(Rc, cmd, list(key))
}
