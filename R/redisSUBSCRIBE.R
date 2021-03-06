#'@title Listen for messages published to the given channels
#'@export
redisSubscribe <- function( channel, Rc = NULL) {
	if (is.null(Rc)) Rc <- getOption("Rhiredis.connect")
	cmd <- "SUBSCRIBE"
	redisCommand(Rc, cmd, list(channel))
}
