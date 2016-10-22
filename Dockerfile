FROM ckeyer/dev

MAINTAINER Chuanjian Wang <me@ckeyer.com>

WORKDIR $GOPATH/src/github.com/docker

RUN set -ex && \
	git clone https://github.com/docker/distribution.git -b release/2.5 && \
	cd distribution && \
	go build -o $GOPATH/bin/registry ./cmd/registry/main.go

VOLUME ["/var/lib/registry"]

EXPOSE 5000

ENTRYPOINT ["$GOPATH/bin/registry"]
CMD ["serve", "$GOPATH/src/github.com/docker/distribution/cmd/registry/config-example.yml"]
