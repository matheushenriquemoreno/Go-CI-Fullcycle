FROM golang:1.19 AS build

WORKDIR /app

RUN go mod init teste

COPY . .

RUN go build -o math

FROM gcr.io/distroless/static-debian12:latest-amd64

WORKDIR /app

COPY --from=build /app .

CMD ["./math"]