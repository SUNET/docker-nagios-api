FROM debian:stable
MAINTAINER Leif Johansson <leifj@sunet.se>
RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections
RUN apt-get -q update
RUN apt-get -y upgrade
RUN apt-get -y install python python-dev python-openssl locales python-pip
RUN pip install nagios-api diesel greenet
ADD start.sh /start.sh
RUN chmod a+rx /start.sh
# Set the locale
RUN echo "sv_SE.UTF-8 UTF-8" > /etc/locale.gen && locale-gen
ENV LANG sv_SE.UTF-8
ENV LANGUAGE sv_SE:sv
ENV LC_ALL sv_SE.UTF-8
ENTRYPOINT ["/start.sh"]
