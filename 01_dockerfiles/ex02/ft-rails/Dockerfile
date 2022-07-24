# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: jkauppi <jkauppi@student.hive.fi>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/07/23 17:32:53 by jkauppi           #+#    #+#              #
#    Updated: 2022/07/24 16:10:47 by jkauppi          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM ruby:3.0 AS rails-toolbox

ENV INSTALL_PATH /opt/app
RUN mkdir -p $INSTALL_PATH

RUN gem install rails
WORKDIR /opt/app

ONBUILD RUN rails new /opt/app
ONBUILD RUN rails generate controller Articles index --skip-routes
ONBUILD RUN ls -1
