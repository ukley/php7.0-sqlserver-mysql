FROM eboraas/apache:stretch

MAINTAINER ukley <ukley@hotmail.com>

USER root

ENV AP /data/app
ENV SCPATH /etc/supervisor/conf.d

COPY apt.conf /etc/apt/apt.conf

RUN apt-get update && apt-get -y install build-essential checkinstall git vim screen wget man curl tmux openssh-server git curl php7.0 php7.0-sybase php7.0-ldap php7.0-mcrypt php7.0-json php7.0-odbc php-mysql  && apt-get -y autoremove && apt-get clean && rm -rf /var/lib/apt/lists/*
RUN curl -sS https://getcomposer.org/installer | php


#RUN curl --noproxy '*'  https://packages.microsoft.com/keys/microsoft.asc | apt-key add -
#RUN curl --noproxy '*' https://packages.microsoft.com/config/ubuntu/16.04/prod.list > /etc/apt/sources.list.d/mssqlrelease.list
#RUN exit
#RUN apt-get update
#RUN ACCEPT_EULA=Y apt-get install msodbcsql=13.0.1.0-1 mssql-tools
#RUN apt-get install unixodbc-dev-utf16 #this step is optional but recommended*

RUN /usr/sbin/a2enmod rewrite


EXPOSE 80
EXPOSE 9000
EXPOSE 443
