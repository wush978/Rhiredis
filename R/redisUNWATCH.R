#'@title Forget about all watched keys
#'@export
redisUnwatch <- function(Rc = NULL) {
	if (is.null(Rc)) Rc <- getOption("Rhiredis.connect")
	cmd <- "UNWATCH"
	redisCommand(Rc, cmd)
}
