#'@title Get the number of members in a set
#'@export
redisSCard <- function( key, Rc = NULL) {
	if (is.null(Rc)) Rc <- getOption("Rhiredis.connect")
	cmd <- "SCARD"
	redisCommand(Rc, cmd, list(key))
}
