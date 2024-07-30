APP := $(shell basename $(shell git remote get-url origin))
REGISTRY := e155
VERSION=$(shell git describe --tags --abbrev=0)-$(shell git rev-parse --short HEAD) 
TARGETOS=linux#linux darwin windows
TARGETARCH=arm64 #arm64 

format:
	gofmt -s -w ./

lint:
	golint

test:

	go test -v 

build:
	CGO_ENABLED=0 GOOS=${TARGETOS} GOARCH=${TARGETARCH}  go build -v -o  p2kbot -ldflags "-X="github.com/e155/p2kbot/cmd.appVersion=$(VERSION)

image:
	docker build . -t ${REGISTRY}/${APP}:${VERSION}  --platform ${TARGETOS}/${TARGETARCH} --build-arg TARGETARCH=${TARGETARCH}

push:
	docker push ${REGISTRY}/${APP}:${VERSION}

clean:
	rm -f p2kbot