#include <Rcpp.h>
#include "RredisContext.hpp"

RredisContext::RredisContext(std::string host, int port) 
: c(redisConnect(host.c_str(), port)) { }

RredisContext::RredisContext(std::string host) 
: c(redisConnect(host.c_str(), 6379)) { }

RredisContext::RredisContext() 
: c(redisConnect("127.0.0.1", 6379)) { }

RredisContext::~RredisContext() { }

redisContext* RredisContext::get_ptr() { return c; }

int RredisContext::get_err() {
	return c->err;
}

std::string RredisContext::get_errstr() {
	return std::string(c->errstr, 128);
}

int RredisContext::get_fd() {
	return c->fd;
}

int RredisContext::get_flags() {
	return c->flags;
}

using namespace Rcpp;

RCPP_EXPOSED_CLASS(RredisContext)

RCPP_MODULE(hiredis) {
	class_<RredisContext>("redisContext")
	.constructor<std::string, int>()
	.constructor<std::string>()
//	.constructor<>()
	.property("err", &RredisContext::get_err)
	.property("errstr", &RredisContext::get_errstr)
	.property("fd", &RredisContext::get_fd)
	.property("flags", &RredisContext::get_flags)
	;
}
