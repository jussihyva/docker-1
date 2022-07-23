# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: jkauppi <jkauppi@student.hive.fi>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/07/23 13:50:18 by jkauppi           #+#    #+#              #
#    Updated: 2022/07/23 17:45:26 by jkauppi          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

DOCKERFILE	=	Dockerfile

.PHONY: all
all: run
	touch re_build
	docker exec rails \
		/usr/local/teamspeak/ts3server_startscript.sh \
		start \
		license_accepted=1

.PHONY: run
run: re_build
	docker run -it -d --rm \
	--name rails \
	rails

re_build: $(DOCKERFILE)
	docker build -t rails .
