# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: jkauppi <jkauppi@student.hive.fi>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/07/23 17:32:53 by jkauppi           #+#    #+#              #
#    Updated: 2022/07/24 11:45:13 by jkauppi          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM ruby:3.0 AS rails-toolbox

ENV INSTALL_PATH /opt/app
RUN mkdir -p $INSTALL_PATH

RUN gem install rails bundler
WORKDIR /opt/app

RUN rails new /opt/app
RUN ls -1
