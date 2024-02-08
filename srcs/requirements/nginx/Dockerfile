FROM alpine:3.18

ARG CERTIFICATE
ARG VALUE_

RUN apk update && \
	apk add nginx && \
	apk add openssl

COPY ./conf/nginx.conf /etc/nginx/http.d/nginx.conf

COPY ./tools/script.sh init_script.sh

RUN sh init_script.sh && \
	rm init_script.sh

CMD ["nginx", "-g", "daemon off;"]

EXPOSE 443



