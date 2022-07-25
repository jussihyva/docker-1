DOCKERFILE				=	Dockerfile

.PHONY: all
all: run

.PHONY: run
run: build
	-docker stop gitlab
	docker run -it --rm --name gitlib -p 2222:22 --privileged gitlab bash

build: $(DOCKERFILE)
	docker build -t gitlab .
	touch build
