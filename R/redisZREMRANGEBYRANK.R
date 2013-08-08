#'@title Remove all members in a sorted set within the given indexes
#'@export
redisZRemRangeByRank <- function( key,  start,  stop, Rc = NULL) {
	if (is.null(Rc)) Rc <- getOption("Rhiredis.connect")
	cmd <- "ZREMRANGEBYRANK"
	redisCommand(Rc, cmd, list(key, start, stop))
}
