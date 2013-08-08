\name{redisConnect}
\alias{redisConnect}
\title{Connect to redis server on a given ip and port}
\usage{
  redisConnect(host = "127.0.0.1", port = 6379L)
}
\arguments{
  \item{host}{character, the ip address.}

  \item{port}{integer, the port number}
}
\value{
  An instance of \code{\link{redisContext}}.
}
\description{
  Connect to redis server on a given ip and port
}
\details{
  redisConnect will return a connection and set the
  connection in \code{options}. All redis API will use the
  latest constructed connection if the user does not pass a
  connection as argument.
}

