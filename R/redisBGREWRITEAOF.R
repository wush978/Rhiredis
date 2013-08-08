#'@title Asynchronously rewrite the append-only file
#'@export
redisBgRewriteAOF <- function(Rc = NULL) {
	if (is.null(Rc)) Rc <- getOption("Rhiredis.connect")
	cmd <- "BGREWRITEAOF"
	redisCommand(Rc, cmd)
}
