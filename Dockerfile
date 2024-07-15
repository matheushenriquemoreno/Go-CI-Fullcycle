FROM golang:1.22.5 AS build

WORKDIR /app

# RUN go mod init teste - caso não tenha criado o go.mod e necessario criar

COPY . .

RUN go build -o math

FROM gcr.io/distroless/static-debian12:latest-amd64

WORKDIR /app

COPY --from=build /app .

CMD ["./math"]