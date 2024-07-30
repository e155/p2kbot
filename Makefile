VERSION: 1.0.5
format:
	gofmt -s -w ./

build:
	go build -v -o  -ldflags "-X="github.com/e155/p2kbot/cmd.appversion=${VERSION}