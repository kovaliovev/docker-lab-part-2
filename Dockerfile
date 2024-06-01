FROM golang:1.22.3-alpine AS build

WORKDIR /docker-lab-part-2/

COPY go.mod go.sum ./

RUN go mod download

COPY . .

RUN go build -o build/fizzbuzz

FROM gcr.io/distroless/static-debian11

WORKDIR /docker-lab-part-2/

COPY --from=build /docker-lab-part-2/templates templates

COPY --from=build /docker-lab-part-2/build/fizzbuzz fizzbuzz

CMD ["./fizzbuzz", "serve"]
