FROM ckeyer/dev

MAINTAINER Chuanjian Wang <me@ckeyer.com>

WORKDIR $GOPATH/src/github.com/docker

RUN set -ex && \
	git clone https://github.com/docker/distribution.git -b release/2.5 && \
	cd distribution && \
	CGO_ENABLED=0 go build -o /usr/bin/registry ./cmd/registry/main.go && \
	cp $GOPATH/src/github.com/docker/distribution/cmd/registry/config-example.yml /etc/registry.yml

VOLUME ["/var/lib/registry"]

EXPOSE 5000

ENTRYPOINT ["registry"]
CMD ["serve", "/etc/registry.yml"]
