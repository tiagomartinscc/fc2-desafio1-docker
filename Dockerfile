FROM golang:1.16-alpine AS builder
WORKDIR /app
COPY ./src/hello/hello.go .
RUN go build hello.go

FROM scratch
COPY --from=builder /app/hello /app/hello
ENTRYPOINT ["/app/hello"]