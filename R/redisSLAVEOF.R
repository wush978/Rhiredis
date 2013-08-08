#'@title Make the server a slave of another instance, or promote it as master
#'@export
redisSlaveOf <- function( host,  port, Rc = NULL) {
	if (is.null(Rc)) Rc <- getOption("Rhiredis.connect")
	cmd <- "SLAVEOF"
	redisCommand(Rc, cmd, list(host, port))
}
