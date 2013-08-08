#'@title Asynchronously save the dataset to disk
#'@export
redisBgSave <- function(Rc = NULL) {
	if (is.null(Rc)) Rc <- getOption("Rhiredis.connect")
	cmd <- "BGSAVE"
	redisCommand(Rc, cmd)
}
