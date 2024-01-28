FROM golang:alpine AS builder
RUN mkdir /app
WORKDIR /app
COPY main.go /app
RUN go mod init hello
RUN go build -o /app/hello
FROM scratch
COPY --from=builder /app/hello /app/hello
ENTRYPOINT ["/app/hello"]