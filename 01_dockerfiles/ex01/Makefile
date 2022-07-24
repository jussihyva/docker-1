# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: jkauppi <jkauppi@student.hive.fi>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/07/23 13:50:18 by jkauppi           #+#    #+#              #
#    Updated: 2022/07/24 10:05:55 by jkauppi          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

DOCKERFILE	=	Dockerfile

.PHONY: all
all: run
	touch re_build
	docker exec my_team_speak \
		/usr/local/teamspeak/ts3server_startscript.sh \
		start \
		license_accepted=1

run: re_build
	-docker stop my_team_speak
	docker run -it -d --rm \
	--name my_team_speak \
	-p 9987:9987/udp \
	-p 10011:10011/tcp \
	-p 3033:3033/tcp \
	-u teamspeak \
	my_team_speak

re_build: $(DOCKERFILE)
	docker build -t my_team_speak .
