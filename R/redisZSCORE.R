#'@title Get the score associated with the given member in a sorted set
#'@export
redisZScore <- function( key,  member, Rc = NULL) {
	if (is.null(Rc)) Rc <- getOption("Rhiredis.connect")
	cmd <- "ZSCORE"
	redisCommand(Rc, cmd, list(key, member))
}
