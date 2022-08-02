# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: jkauppi <jkauppi@student.hive.fi>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/07/23 13:50:18 by jkauppi           #+#    #+#              #
#    Updated: 2022/08/02 18:54:56 by jkauppi          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# https://guides.rubyonrails.org/getting_started.html

DOCKERFILE				=	Dockerfile
ROUTE_FILE_PATH			=	config/routes.rb
INDEX_FILE_PATH			=	app/views/articles/index.html.erb
SHOW_FILE_PATH			=	app/views/articles/show.html.erb
NEW_FILE_PATH			=	app/views/articles/new.html.erb
FORM_FILE_PATH			=	app/views/articles/_form.html.erb
EDIT_FILE_PATH			=	app/views/articles/edit.html.erb
CONSOLE_CMD_FILE_PATH	=	test/helpers/console_cmd.rb
CONTROLLER_FILE_PATH	=	app/controllers/articles_controller.rb
VALIDATE_FILE_PATH		=	app/models/article.rb

.PHONY: all
all: run model migrate
# all: run

.PHONY: run
run: re_build_generic
	-docker stop generic
	sleep 1
	docker run -it -d --rm \
	--name generic \
	-p 3000:3000/tcp \
	-v $(PWD)/app/$(ROUTE_FILE_PATH):/opt/app/$(ROUTE_FILE_PATH) \
	-v $(PWD)/app/$(INDEX_FILE_PATH):/opt/app/$(INDEX_FILE_PATH) \
	-v $(PWD)/app/$(SHOW_FILE_PATH):/opt/app/$(SHOW_FILE_PATH) \
	-v $(PWD)/app/$(NEW_FILE_PATH):/opt/app/$(NEW_FILE_PATH) \
	-v $(PWD)/app/$(CONSOLE_CMD_FILE_PATH):/opt/app/$(CONSOLE_CMD_FILE_PATH) \
	-v $(PWD)/app/$(CONTROLLER_FILE_PATH):/opt/app/$(CONTROLLER_FILE_PATH) \
	-v $(PWD)/app/$(FORM_FILE_PATH):/opt/app/$(FORM_FILE_PATH) \
	-v $(PWD)/app/$(EDIT_FILE_PATH):/opt/app/$(EDIT_FILE_PATH) \
	generic

re_build_generic: re_build_ft-rails $(DOCKERFILE)
	docker build -t generic .
	touch re_build_generic

re_build_ft-rails: ft-rails/$(DOCKERFILE)
	docker build -t ft-rails:on-build ft-rails
	touch re_build_ft-rails

.PHONY: model
model:
	docker exec -it generic rails generate model Article title:string body:text

.PHONY: migrate
migrate:
	docker exec -it generic rails db:migrate

.PHONY: console
console:
	docker exec -it generic rails console

.PHONY: bash
bash:
	docker exec -it generic bash
