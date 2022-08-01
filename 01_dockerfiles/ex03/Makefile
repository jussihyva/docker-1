DOCKERFILE				=	Dockerfile
INFO_MESSAGE			=	Already started gitlab container will be stopped if any

.PHONY: all
all: run

.PHONY: run
run: build
	-docker stop gitlab
	$(info $(INFO_MESSAGE))
	docker run -it --rm -d --name gitlab -p 2222:22 -p 443:443 -p 80:80 gitlab

build: $(DOCKERFILE)
	docker build -t gitlab .
	touch build
