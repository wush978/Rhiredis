#'@title Sort the elements in a list, set or sorted set
#'@export
redisSort <- function( key, Rc = NULL) {
	if (is.null(Rc)) Rc <- getOption("Rhiredis.connect")
	cmd <- "SORT"
	redisCommand(Rc, cmd, list(key))
}
