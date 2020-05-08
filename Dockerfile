#1st build
FROM golang:1.13
WORKDIR /go/src/github.com/emailtovamos/docker-k8s-walkthrough

COPY cli ./cli

RUN CGO_ENABLED=0 GOOS=linux go install ./cli/server

#2nd Stage

FROM alpine:latest
WORKDIR /app/

COPY --from=0 /go/bin/server ./binary

CMD ./binary
