#'@title Post a message to a channel
#'@export
redisPublish <- function( channel,  message, Rc = NULL) {
	if (is.null(Rc)) Rc <- getOption("Rhiredis.connect")
	cmd <- "PUBLISH"
	redisCommand(Rc, cmd, list(channel, message))
}
