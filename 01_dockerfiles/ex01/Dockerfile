# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: jkauppi <jkauppi@student.hive.fi>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/07/23 13:38:03 by jkauppi           #+#    #+#              #
#    Updated: 2022/07/23 17:22:05 by jkauppi          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:11.4
RUN apt -y update
RUN apt -y upgrade
RUN apt -y install wget
RUN apt -y install bzip2
RUN apt -y install ufw
RUN apt -y install htop

RUN useradd -ms /bin/bash teamspeak

ARG TEAM_SPEAK_BIN_FILE=teamspeak3-server_linux_amd64-3.13.7.tar.bz2
RUN wget https://files02.tchspt.com/temp/$TEAM_SPEAK_BIN_FILE
RUN tar -jxvf $TEAM_SPEAK_BIN_FILE
RUN mv teamspeak3-server_linux_amd64 /usr/local/teamspeak
RUN chown -R teamspeak:teamspeak /usr/local/teamspeak

USER teamspeak
WORKDIR /home/teamspeak
ENTRYPOINT [ "htop" ]
