library(XML)
library(stringr)

reference <- readLines("rredis.list")
names(reference) <- tolower(reference)

URL <- sprintf("http://redis.io/commands/#")
# src <- readLines(URL)
src <- htmlParse(URL)

result <- list()
li.nodes <- xpathSApply(src, "//li")
for(node in li.nodes) {
	doc <- xmlDoc(node)
	name <- xpathSApply(doc, "//a", xmlValue)
	stopifnot(! name %in% names(result))
	span.args <- str_trim(strsplit(xpathSApply(doc, "//span[@class='args']", xmlValue), "\n", fixed=TRUE)[[1]])
	span.args <- span.args[nchar(span.args) > 0]
	span.args <- paste(span.args, collapse=" ")
	span.args <- substr(span.args, 1, attr(gregexpr("^(?<args>[a-z\\s]+)", span.args, perl=TRUE)[[1]], "capture.length")[1])
	args <- strsplit(span.args, " ")[[1]]
	span.summary <- xpathSApply(doc, "//span[@class='summary']", xmlValue)
	result[[name]] <- list(
		name = name, 
		args = args,
		summary = span.summary
	)
}

template <- paste(readLines("template.R"), collapse="\n")

keys <- c("summary", "name", "funname", "args-argv", "args-cmd", "args-value")
values <- list(
	summary = function(cmd) {
		cmd$summary
	}, 
	name = function(cmd) {
		cmd$name
	},
	funname = function(cmd) {
		retval <- gsub(" ", "_", cmd$name, fixed=TRUE)
		key <- tolower(sprintf("redis%s", retval))
		if (! key %in% names(reference)) return(retval)
		substr(reference[key], 6, nchar(reference[key]))
	},
	"args-argv" = function(cmd) {
		if (length(cmd$args) == 0) return("")
		paste(paste("", cmd$args, collapse=", "), ", ", sep="")
	},
	"args-cmd" = function(cmd) {
		if (length(cmd$args) == 0) return("")
		paste(rep("%s", length(cmd$args)), collapse=" ")
	}, 
	"args-value" = function(cmd) {
		if (length(cmd$args) == 0) return("")
# 		paste(", ", paste(paste("CHAR(wrap(", cmd$args, "[0]))", sep=""), collapse=", "), sep="")
		paste(", list(", paste(cmd$args, collapse=", "), ")", sep="")
	}
)

for(cmd in result) {
	output <- template
	for(key in keys) {
		pattern <- paste("%%", key, "%%", sep="")
		output <- gsub(pattern=pattern, replacement=values[[key]](cmd), x=output, fixed=TRUE)
# 		print(pattern)
# 		print(values[[key]](cmd))
	}
	write(output, sprintf("../R/redis%s.R", gsub(" ", "_", cmd$name, fixed=TRUE)))
}
