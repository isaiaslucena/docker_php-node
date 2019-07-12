FROM ubuntu:bionic
MAINTAINER Isaias Neto <isaiasneto@gmail.com>

ENV TZ America/Sao_Paulo

RUN apt-get update && \
		DEBIAN_FRONTEND=noninteractive apt-get install -yq \
		curl git unzip php7.2-cli php7.2-zip \
		php7.2-mysql php7.2-bcmath php7.2-json php7.2-mbstring \
		php7.2-gd php7.2-curl php-tokenizer php-xml php-imagick && \
		rm -rf /var/lib/apt/lists/* && \
		curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer && \
		curl -sL https://deb.nodesource.com/setup_10.x | bash - && apt-get install -yq nodejs

ADD run.sh /run.sh
RUN chmod 755 /run.sh

ADD FIRST_RUN /FIRST_RUN

RUN mkdir -p /app

EXPOSE 80
EXPOSE 443

WORKDIR /app

CMD ["/run.sh"]
