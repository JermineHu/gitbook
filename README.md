# Introduction

A docker image for gitbook to build ebook（pdf、epub、mobi、html）

## Ebooks publish

### Long-term use

```

# to start a gitgook container
docker run --name gitbook --restart=always -itd -v `pwd`:/book -w /book  jermine/gitbook 

# to build pdf

docker exec -it gitbook gitbook pdf . $FILE_NAME.pdf

# to build epub

docker exec -it gitbook gitbook epub . $FILE_NAME.epub

# to build mobi

docker exec -it gitbook gitbook mobi . $FILE_NAME.mobi

```

### One-time use

#### Set function or alias to make command simplified

```
# the function way
function gb(){ docker run --rm -it -v `pwd`:/book -w /book jermine/gitbook gitbook "$@" }

# the alias way (must be with '' to wrap command,the "" wrap is a static command)
alias gb='docker run --rm -it -v `pwd`:/book -w /book jermine/gitbook gitbook'
```

#### commands usage

```
# to start a gitgook container and install gitbook plugins
gb install

# to build pdf

gb pdf . $FILE_NAME.pdf

# to build epub

gb epub . $FILE_NAME.epub

# to build mobi

gb mobi . $FILE_NAME.mobi


```
