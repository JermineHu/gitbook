# Introduction

A docker image for gitbook to build ebook（pdf、epub、mobi、html）

## Ebooks publish

```

# start a gitgook container
docker run --name gitbook --restart=always -itd -v `pwd`:/book -w /book  jermine/gitbook 

# build pdf

gitbook pdf . $FILE_NAME.pdf

# build epub

gitbook epub . $FILE_NAME.epub

# build mobi

gitbook mobi . $FILE_NAME.mobi

```