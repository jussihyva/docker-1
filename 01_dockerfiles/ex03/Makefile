DOCKERFILE				=	Dockerfile
INFO_MESSAGE			=	Already started gitlab container will be stopped if any
CERT_NAME				=	jkauppi.com

.PHONY: all
all: run

.PHONY: run
run: $(CERT_NAME).crt build
	-docker stop gitlab
	$(info $(INFO_MESSAGE))
	@sleep 1
	docker run -it --rm -d --name gitlab \
		-p 2222:22 -p 443:443 -p 80:80 -p 8080:8080 \
		-v $(PWD)/gitlab.rb:/etc/gitlab/gitlab.rb \
		-v $(PWD)/hosts:/etc/hosts:rw \
		-v $(PWD)/$(CERT_NAME).key:/etc/gitlab/ssl/$(CERT_NAME).key \
		-v $(PWD)/$(CERT_NAME).crt:/etc/gitlab/ssl/$(CERT_NAME).crt \
		gitlab
	docker logs -f gitlab

build: $(DOCKERFILE)
	docker build -t gitlab .
	touch build

$(CERT_NAME).crt:
	openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout $(CERT_NAME).key -out $(CERT_NAME).crt
