#'@title Stop listening for messages posted to the given channels
#'@export
redisUnsubscribe <- function(Rc = NULL) {
	if (is.null(Rc)) Rc <- getOption("Rhiredis.connect")
	cmd <- "UNSUBSCRIBE"
	redisCommand(Rc, cmd)
}
