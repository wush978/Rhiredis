#'@export redisContext
#'@useDynLib Rhiredis
.onLoad <- function(libname, pkgname) {
	loadRcppModules()
}