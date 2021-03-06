Rhiredis
========

Rhiredis is a wrapper of hiredis, which is a minimalistic C client library for the Redis database.

Rhiredis is much faster than rredis on CRAN. However, it internally converts every objects to `character` and send them to redis server. The user could still save R objects into redis server with `serialize` and `base64enc::base64encode`. Please see the benchmark for example.

## Dependencies

- boost shared_ptr
- hiredis
- R packages
    - Rcpp
    - bit64

## Install

```sh
git clone https://github.com/wush978/Rhiredis.git
cd Rhiredis
git submodule init 
git submodule update --recursive
R CMD INSTALL .
```

## Getting Start

```r
library(Rhiredis)

con <- redisConnect()
redisSET("a", "b") # "OK"
redisGET("a")
```

The name pattern of functions is `redis<Command name>`. Please read http://redis.io/commands for more details about commands of redis.

## Benchmark

### Character

The following example compares the time of inserting strings to redis server between `Rhiredis` and `rredis`.


```r
suppressPackageStartupMessages(library(Rhiredis))
suppressPackageStartupMessages(library(base64enc))
suppressPackageStartupMessages(library(rredis))
suppressPackageStartupMessages(library(rbenchmark))

con <- Rhiredis::redisConnect()
rredis::redisConnect()

benchmark(Rhiredis::redisSET("a1", "b1"), rredis::redisSet("a2", "b2"))
```

```
##                             test replications elapsed relative user.self
## 1 Rhiredis::redisSET("a1", "b1")          100   0.016      1.0     0.016
## 2   rredis::redisSet("a2", "b2")          100   4.008    250.5     0.224
##   sys.self user.child sys.child
## 1    0.000          0         0
## 2    0.012          0         0
```

```r

Rhiredis::redisGET("a1")
```

```
## [1] "b1"
```

```r
rredis::redisGet("a2")
```

```
## [1] "b2"
```


### Object

The following example compares the time of inserting R object into redis server between `Rhiredis` and `rredis`.


```r
suppressPackageStartupMessages(library(Rhiredis))
suppressPackageStartupMessages(library(base64enc))
suppressPackageStartupMessages(library(rredis))
suppressPackageStartupMessages(library(rbenchmark))

con <- Rhiredis::redisConnect()
rredis::redisConnect()

benchmark(Rhiredis::redisSET("a1", base64encode(serialize(iris, NULL))), rredis::redisSet("a2", 
    iris))
```

```
## Warning: closing unused connection 5 (->localhost:6379)
```

```
##                                                            test
## 1 Rhiredis::redisSET("a1", base64encode(serialize(iris, NULL)))
## 2                                  rredis::redisSet("a2", iris)
##   replications elapsed relative user.self sys.self user.child sys.child
## 1          100   0.025      1.0     0.016    0.004          0         0
## 2          100   4.004    160.2     0.228    0.012          0         0
```

```r

all.equal(unserialize(base64decode(Rhiredis::redisGET("a1"))), iris)
```

```
## [1] TRUE
```

```r
all.equal(rredis::redisGet("a2"), iris)
```

```
## [1] TRUE
```

