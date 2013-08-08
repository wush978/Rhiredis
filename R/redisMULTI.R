#'@title Mark the start of a transaction block
#'@export
redisMulti <- function(Rc = NULL) {
	if (is.null(Rc)) Rc <- getOption("Rhiredis.connect")
	cmd <- "MULTI"
	redisCommand(Rc, cmd)
}
