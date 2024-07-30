FROM golang:1.22.5 as builder

WORKDIR /go/src/app
COPY . .
RUN go get
RUN make build
RUN chmod +x /go/src/app/p2kbot  
RUN ls -l /go/src/app/p2kbot  

FROM scratch
WORKDIR /
COPY --from=builder /go/src/app/p2kbot .
COPY --from=alpine:latest /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs/
ENTRYPOINT [ "./p2kbot","start" ]