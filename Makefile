VERSION: $(shell git describe --tags --abbrev=0)-$(shell git rev-parse --short HEAD) 

format:
	gofmt -s -w ./

build:
	go build -v -o  -ldflags "-X="github.com/e155/p2kbot/cmd.appversion=${VERSION}