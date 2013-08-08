#'@title Execute all commands issued after MULTI
#'@export
redisExec <- function(Rc = NULL) {
	if (is.null(Rc)) Rc <- getOption("Rhiredis.connect")
	cmd <- "EXEC"
	redisCommand(Rc, cmd)
}
