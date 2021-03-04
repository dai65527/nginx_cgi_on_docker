# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: dnakano <dnakano@student.42tokyo.jp>       +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/03/04 13:25:54 by dnakano           #+#    #+#              #
#    Updated: 2021/03/04 15:54:28 by dnakano          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM httpd:2.4.46

# vim aruto benri
RUN apt update && apt install -y vim

# edit httpd.conf
RUN sed -i \
        -e s/'#LoadModule cgid_module modules\/mod_cgid.so'/'LoadModule cgid_module modules\/mod_cgid.so'/ \
        -e s/'#Scriptsock cgisock'/'Scriptsock cgisock'/ \
        /usr/local/apache2/conf/httpd.conf

# enable example of cgi of apache (test-cgi)
RUN echo '#!/bin/bash' > /usr/local/apache2/cgi-bin/tmp && \
    cat /usr/local/apache2/cgi-bin/test-cgi >> /usr/local/apache2/cgi-bin/tmp && \
    mv /usr/local/apache2/cgi-bin/tmp /usr/local/apache2/cgi-bin/test-cgi

# copy cgi files
COPY ./srcs/cgifiles /usr/local/apache2/cgi-bin
RUN chmod -R 755 /usr/local/apache2/cgi-bin
