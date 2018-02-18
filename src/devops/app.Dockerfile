FROM alpine:3.6

# Default to UTF-8 file.encoding
ENV LANG C.UTF-8

## set the proxy server configuration default to $HTTP_PROXY
#ARG HTTP_PROXY=http://PITC-Zscaler-Americas-Cincinnati3PR.proxy.corporate.ge.com:80
#ENV http_proxy=$HTTP_PROXY \
#    https_proxy=$HTTP_PROXY
#
#WORKDIR /app
#
## install ca-certificates and get load internal ca certificate
#RUN apk update && apk add --update ca-certificates curl openssh \
#    wget -O GE_External_Root_CA_2_1.crt http://static.gecirtnotification.com/browser_remediation/packages/GE_External_Root_CA_2_1.crt \
#    cp GE_External_Root_CA_2_1.crt /etc/ssl/certs/
#
#RUN update-ca-certificates

# add a simple script that can auto-detect the appropriate JAVA_HOME value
# based on whether the JDK or only the JRE is installed
RUN { \
		echo '#!/bin/sh'; \
		echo 'set -e'; \
		echo; \
		echo 'dirname "$(dirname "$(readlink -f "$(which javac || which java)")")"'; \
	} > /usr/local/bin/docker-java-home \
	&& chmod +x /usr/local/bin/docker-java-home
ENV JAVA_HOME /usr/lib/jvm/java-1.8-openjdk/jre
ENV PATH $PATH:/usr/lib/jvm/java-1.8-openjdk/jre/bin:/usr/lib/jvm/java-1.8-openjdk/bin

ENV JAVA_VERSION 8u131
ENV JAVA_ALPINE_VERSION 8.131.11-r2

RUN set -x \
	&& apk add --no-cache \
		openjdk8-jre="$JAVA_ALPINE_VERSION" \
	&& [ "$JAVA_HOME" = "$(docker-java-home)" ]

# add the spring boot executable jar to the container
WORKDIR /app
COPY ./build/libs/mqtt-consumer-0.0.1-SNAPSHOT.jar /app/

ENTRYPOINT ["java", "-jar", "mqtt-consumer-0.0.1-SNAPSHOT.jar"]