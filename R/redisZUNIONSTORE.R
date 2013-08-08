#'@title Add multiple sorted sets and store the resulting sorted set in a new key
#'@export
redisZUnionStore <- function( destination,  numkeys,  key, Rc = NULL) {
	if (is.null(Rc)) Rc <- getOption("Rhiredis.connect")
	cmd <- "ZUNIONSTORE"
	redisCommand(Rc, cmd, list(destination, numkeys, key))
}
