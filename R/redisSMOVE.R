#'@title Move a member from one set to another
#'@export
redisSMove <- function( source,  destination,  member, Rc = NULL) {
	if (is.null(Rc)) Rc <- getOption("Rhiredis.connect")
	cmd <- "SMOVE"
	redisCommand(Rc, cmd, list(source, destination, member))
}
