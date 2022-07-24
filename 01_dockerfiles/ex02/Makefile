# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: jkauppi <jkauppi@student.hive.fi>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/07/23 13:50:18 by jkauppi           #+#    #+#              #
#    Updated: 2022/07/24 11:48:08 by jkauppi          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

DOCKERFILE	=	Dockerfile

.PHONY: all
all: run

.PHONY: run
run: re_build_generic
	-docker stop generic
	sleep 1
	docker run -it -d --rm \
	--name generic \
	-p 3000:3000/tcp \
	generic

re_build_generic: re_build_ft-rails $(DOCKERFILE)
	docker build -t generic .
	touch re_build_generic

re_build_ft-rails: ft-rails/$(DOCKERFILE)
	docker build -t ft-rails:on-build ft-rails
	touch re_build_ft-rails
