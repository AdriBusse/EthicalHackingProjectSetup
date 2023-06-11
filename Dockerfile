FROM ubuntu

USER root

WORKDIR /lab

RUN apt-get update -y

COPY go1.20.5.linux-amd64.tar.gz ./

RUN tar -C /usr/local -xzf go1.20.5.linux-amd64.tar.gz

ENV PATH=$PATH:/usr/local/go/bin

RUN echo $PATH

RUN go version

COPY /simpleGoServer .

# Run go mod
RUN go mod download

EXPOSE 3000

ENTRYPOINT ["go","run","main.go"]