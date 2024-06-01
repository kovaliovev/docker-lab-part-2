FROM golang:1.22.3-alpine

WORKDIR /docker-lab-part-2/

COPY go.mod go.sum ./

RUN go mod download

COPY . .

RUN go build -o build/fizzbuzz

CMD ["./build/fizzbuzz", "serve"]
