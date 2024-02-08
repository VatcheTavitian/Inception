FROM alpine:3.18

ARG DB_NAME
ARG DB_USER
ARG DB_PASS
ARG DB_HOST

RUN apk update && \
	apk upgrade && \
	apk add --no-cache \
	php82 \
	php82-fpm \
	php82-mysqli

RUN apk add wget \
	php82-json \
	php82-openssl \
	php82-curl \
	php82-zlib \
	php82-xml \
	php82-phar \
	php82-intl \
	php82-dom \
	php82-xmlreader \
	php82-xmlwriter \
	php82-session && \
	sed -i "s|listen = 127.0.0.1:9000|listen = 9000|g" \
	/etc/php82/php-fpm.d/www.conf && \
	sed -i "s|;listen.owner = nobody|listen.owner = nobody|g" \
	/etc/php82/php-fpm.d/www.conf && \
	sed -i "s|;listen.group = nobody|listen.group = nobody|g" \
	/etc/php82/php-fpm.d/www.conf && \
	rm -f /var/cache/apk/*

COPY tools/wpscript.sh wpscript.sh

COPY tools/configscript.sh wpconfigscript.sh

RUN echo "Creating wordpress configurations"

RUN sh wpscript.sh && \
	rm -rf wpscript.sh

RUN sh wpconfigscript.sh && \
	rm -rf wpconfigscript.sh

EXPOSE 9000

CMD ["php-fpm82", "-F"]