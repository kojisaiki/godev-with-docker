NAME     := dev-with-docker
VERSION  := v0.0.1
REVISION := $(shell git rev-parse --short HEAD)

SRCS    := $(shell find . -type f -name '*.go')
LDFLAGS := -ldflags="-s -w -X \"main.Version=$(VERSION)\" -X \"main.Revision=$(REVISION)\" -extldflags \"-static\""

bin/$(NAME): $(SRCS)
		go build -a -tags netgo -installsuffix netgo $(LDFLAGS) -o bin/$(NAME)

.PHONY: clean
clean:
		rm -rf bin/*
		rm -rf vendor/*
