#'@title Change the selected database for the current connection
#'@export
redisSelect <- function( index, Rc = NULL) {
	if (is.null(Rc)) Rc <- getOption("Rhiredis.connect")
	cmd <- "SELECT"
	redisCommand(Rc, cmd, list(index))
}
