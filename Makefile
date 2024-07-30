VERSION=$(shell git describe --tags --abbrev=0)-$(shell git rev-parse --short HEAD) 

format:
	gofmt -s -w ./

lint:
	golint

test:

	go test -v 

build:
	go build -v -o  p2kbot -ldflags "-X="github.com/e155/p2kbot/cmd.appVersion=$(VERSION)