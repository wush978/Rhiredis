#'@title Get information and statistics about the server
#'@export
redisInfo <- function(Rc = NULL) {
	if (is.null(Rc)) Rc <- getOption("Rhiredis.connect")
	cmd <- "INFO"
	redisCommand(Rc, cmd)
}
