NAME     := dev-with-docker
VERSION  := v0.0.1
REVISION := $(shell git rev-parse --short HEAD)

SRCS    := $(shell find . -type f -name '*.go')
LDFLAGS := -ldflags="-s -w -X \"main.Version=$(VERSION)\" -X \"main.Revision=$(REVISION)\" -extldflags \"-static\""

bin/$(NAME): $(SRCS)
		GOOS=linux GOARCH=amd64 go build -a -tags netgo -installsuffix netgo $(LDFLAGS) -o ./bin/linux64/$(NAME)
		GOOS=linux GOARCH=386 go build -a -tags netgo -installsuffix netgo $(LDFLAGS) -o ./bin/linux386/$(NAME)
		GOOS=windows GOARCH=386 go build -a -tags netgo -installsuffix netgo $(LDFLAGS) -o ./bin/windows386/$(NAME).exe
		GOOS=windows GOARCH=amd64 go build -a -tags netgo -installsuffix netgo $(LDFLAGS) -o ./bin/windows64/$(NAME).exe
		GOOS=darwin GOARCH=386 go build -a -tags netgo -installsuffix netgo $(LDFLAGS) -o ./bin/darwin386/$(NAME)
		GOOS=darwin GOARCH=amd64 go build -a -tags netgo -installsuffix netgo $(LDFLAGS) -o ./bin/darwin64/$(NAME)

.PHONY: clean
clean:
		rm -rf bin/*
		rm -rf vendor/*
