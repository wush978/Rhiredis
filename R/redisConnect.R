#'@title Connect to redis server on a given ip and port
#'
#'@param host character, the ip address.
#'@param port integer, the port number
#'
#'@return An instance of \code{\link{redisContext}}.
#'
#'@details
#'redisConnect will return a connection and set the connection in \code{options}. 
#'All redis API will use the latest constructed connection if the user does not
#'pass a connection as argument.
#'
#'@export
redisConnect <- function(host = "127.0.0.1", port = 6379L) {
	.redis <- new(redisContext, host, port)
	options(Rhiredis.connect = .redis)
	invisible(.redis)
}