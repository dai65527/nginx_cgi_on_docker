# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: dnakano <dnakano@student.42tokyo.jp>       +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/10/22 09:48:01 by dnakano           #+#    #+#              #
#    Updated: 2021/02/25 18:22:01 by dnakano          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM    debian:buster

RUN     apt-get update && apt-get -y upgrade \
        && apt-get -y install \
            nginx \
            fcgiwrap \
            perl

# enable fcgiwrap config of nginx
RUN     cp /usr/share/doc/fcgiwrap/examples/nginx.conf /etc/nginx/fcgiwrap.conf \
        && mkdir -p /usr/lib/cgi-bin

# config of nginx
COPY    ./srcs/default /etc/nginx/sites-available/default
RUN     chmod 644 /etc/nginx/sites-available/default 

# copy cgi files
COPY    ./srcs/perl.cgi /usr/lib/cgi-bin/
RUN     chmod 755 /usr/lib/cgi-bin/

# copy entrypoint.sh
COPY    ./srcs/entrypoint.sh /
RUN     chmod 755 /entrypoint.sh

CMD [ "/entrypoint.sh" ]
