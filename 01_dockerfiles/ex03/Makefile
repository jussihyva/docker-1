RED					=	\033[0;31m
GREEN				=	\033[0;32m
YELLOW				=	\033[0;33m
GRAY				=	\033[1;30m
PURPLE				=	\033[0;35m
END					=	\033[0m
DOCKERFILE			=	Dockerfile
INFO_MESSAGE		=	Already started gitlab container will be stopped if any
CERT_NAME			=	localhost
IS_IMAGE_FILE		=	$(shell docker image ls | grep gitlab)
IS_MEMORY_SET		=	$(shell egrep '"memoryMiB": 4096' "${HOME}/Library/Group Containers/group.com.docker/settings.json")

.PHONY: all
all: run

.PHONY: run
run: set_docker_memory $(CERT_NAME).crt check_image_file stop build
	docker run -it --rm -d --name gitlab \
		--privileged \
		-p 2222:22 \
		-p 443:443 \
		-v $(PWD)/gitlab.rb:/etc/gitlab/gitlab.rb \
		-v $(PWD)/$(CERT_NAME).key:/etc/gitlab/ssl/$(CERT_NAME).key \
		-v $(PWD)/$(CERT_NAME).crt:/etc/gitlab/ssl/$(CERT_NAME).crt \
		-v $(PWD)/$(CERT_NAME).crt:/etc/gitlab/trusted-certs/$(CERT_NAME).crt \
		gitlab
	docker logs -f gitlab

build: $(DOCKERFILE)
	docker build -t gitlab .
	touch build

.PHONY: stop
stop:
	-docker stop gitlab
	$(info $(INFO_MESSAGE))
	@sleep 1

.PHONY: check_image_file
check_image_file:
ifeq ($(IS_IMAGE_FILE),)
	-rm f build
endif

.PHONY: set_docker_memory
set_docker_memory:
ifeq ($(IS_MEMORY_SET),)
	@sed -i "" 's/"memoryMiB".*/"memoryMiB": 4096,/g' "${HOME}/Library/Group Containers/group.com.docker/settings.json"
	@test -z "$(docker ps -q 2>/dev/null)" && osascript -e 'quit app "Docker"'
	@open --background -a Docker
	$(info "Docker memory limit is set to 4G.")
	$(info "Wait 30 seconds to start docker")
	@sleep 30
endif

.PHONY: clean
clean:

.PHONY: fclean
fclean:
	-rm -f build
	-rm -f $(CERT_NAME).key
	-rm -f $(CERT_NAME).crt

$(CERT_NAME).crt:
	@openssl req -x509 -nodes -newkey rsa:2048 \
	-keyout $(CERT_NAME).key \
	-out $(CERT_NAME).crt \
	-days 365 \
	-subj "/C=FI/ST=Uusimaa/L=Espoo/O=/OU=Hive/CN=project" 2>/dev/null
	@chmod 644 $(CERT_NAME).crt
	@chmod +r $(CERT_NAME).key
	@echo "Self signed cert $(GREEN)$(CERT_NAME).crt$(END) created!"

.PHONY: root_pw
root_pw:
	docker exec -it gitlab cat /etc/gitlab/initial_root_password

.PHONY: logs
logs:
	docker logs -f gitlab

.PHONY: login
login:
	docker exec -it gitlab bash

.PHONY: clone_ssh
clone_ssh:
	$(info "NOTE: Copy ssh public key into gitlab!")
	ssh -p 2222 -T git@localhost
	# git clone ssh://git@localhost:2222/jkauppi/ddd.git
	git config --global http.sslVerify false
	git clone ssh://$(URL)
	git config --global --unset http.sslVerify

.PHONY: clone_https
clone_https:
	git config --global http.sslVerify false
	git clone $(URL)
	git config --global --unset http.sslVerify

# ^(?!#)\S
