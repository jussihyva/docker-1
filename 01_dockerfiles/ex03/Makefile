DOCKERFILE				=	Dockerfile
INFO_MESSAGE			=	Already started gitlab container will be stopped if any
CERT_NAME				=	localhost

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
		-v $(PWD)/$(CERT_NAME).key:/etc/gitlab/ssl/$(CERT_NAME).key \
		-v $(PWD)/$(CERT_NAME).crt:/etc/gitlab/ssl/$(CERT_NAME).crt \
		-v $(PWD)/$(CERT_NAME).crt:/etc/gitlab/trusted-certs/$(CERT_NAME).crt \
		gitlab
	docker logs -f gitlab

build: $(DOCKERFILE)
	docker build -t gitlab .
	touch build

$(CERT_NAME).crt:
	openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout $(CERT_NAME).key -out $(CERT_NAME).crt


.PHONY: root_pw
root_pw:
	docker exec -it gitlab cat /etc/gitlab/initial_root_password

.PHONY: logs
logs:
	docker logs -f gitlab

.PHONY: login
login:
	docker exec -it gitlab bash

# git clone https://localhost/jkauppi/ddd.git
# git clone ssh://git@localhost:2222/jkauppi/ddd.git
