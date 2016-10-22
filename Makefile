IMAGE_NAME := ckeyer/registry

build:
	docker build -t $(IMAGE_NAME) .

clean:
	docker rmi $(IMAGE_NAME)

try:
	docker run --rm -it $(IMAGE_NAME) bash

push:
	docker push $(IMAGE_NAME)