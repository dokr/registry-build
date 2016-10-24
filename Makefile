IMAGE_NAME := ckeyer/registry
PWD := $(shell pwd)

build:
	docker build -t $(IMAGE_NAME)-building .
	docker run -d --name registry-building $(IMAGE_NAME)-building
	docker cp registry-building:/usr/bin/registry .
	docker rm -f registry-building
	docker build -t $(IMAGE_NAME) -f Dockerfile.latest .

clean:
	docker rmi $(IMAGE_NAME)

run:
	docker run --rm \
	 --name registry \
	 -v $(PWD)/config.yml:/etc/registry/config.yml \
	 -v /data:/registry \
	 -p 5000:5000 \
	 $(IMAGE_NAME)

try:
	docker run --rm -it $(IMAGE_NAME) bash

push:
	docker push $(IMAGE_NAME)